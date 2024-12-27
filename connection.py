import streamlit as st
import pandas as pd
import pyodbc

# Replace these values with your server and database details
server = 'Saif\MSSQLSERVER01'
database = 'Earl_Harbor'
username = 'k'
password = '1234'

conn = pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}')
cursor = conn.cursor()

# Function for customs calculation
def calculate_customs(vessel_weight, shipment_weight, shipment_cost):
    base_customs = 0.05 * shipment_cost
    shipment_weight_surcharge = 0.01 * shipment_weight
    
    vessel_weight_surcharge = 0.02 * vessel_weight
    
    total_customs = base_customs + vessel_weight_surcharge + shipment_weight_surcharge
    return round(total_customs, 2)

authenticated = False



# Display the login card
if "logged_in" not in st.session_state:
    
    st.title("Login Page")
    username = st.text_input("Username")
    password = st.text_input("Password", type="password")
    
    if st.button("Login"):
        cursor.execute("SELECT * FROM Users WHERE Name = ? AND Password = ?", (username, password))
        rows = cursor.fetchall()
        if rows:
            st.session_state["logged_in"] = True
            st.success("Login successful!")
            st.rerun()
        else:
            st.error("Invalid Credentials")
    if "logged_in" in st.session_state and st.session_state["logged_in"]:
        st.rerun()
    
if "logged_in" in st.session_state and st.session_state["logged_in"]:

    st.title("Earl Harbor")
    st.sidebar.title("Navigation")
    page = st.sidebar.radio("Select a Page", ["Port Data", "Customs Calculation", "Custom Queries"])


    if page == "Port Data":
        
        cursor.execute("""
            SELECT name 
            FROM sys.tables;
        """)
        tables = cursor.fetchall()
        
        choice = st.selectbox('Select a table to display', [table[0] for table in tables if table[0] != "Users"])
        
        
        
        st.header(f"{choice.capitalize() or 'Vessel'} Details")
        
        query = f"SELECT * FROM {choice or 'Vessel'}"
        df = pd.read_sql(query, conn) 
        st.write(df if choice != "Users" else None)

    elif page == "Customs Calculation":
        st.header("Calculate Customs for a Vessel")
        
        cursor.execute("""
            SELECT *
            FROM Vessel               
        """)
        vessels = cursor.fetchall()
        choice = st.selectbox('Select a vessel to calculate its customs', [vessel[1] for vessel in vessels if vessel[0] != "Users"])
        
        cursor.execute("""
            SELECT v.Name AS vessel_name, SUM(v.Weight) AS vessel_weight, SUM(s.Weight) AS shipment_weight, SUM(s.Cost) AS shipment_cost
            FROM Vessel v
            JOIN Shipment s ON s.Vessel_id = v.Vessel_id
            WHERE v.Name = ?
            GROUP BY v.Name;
        """, (choice,))

        vessel = cursor.fetchone()
        st.write(vessel)
        vessel_weight = st.number_input("Enter Vessel Weight (kg)", min_value=0, value=vessel[1])
        shipment_weight = st.number_input("Enter Shipment Weight ($)", min_value=0, value=vessel[2])
        shipment_cost = st.number_input("Enter Shipment cost ($)", min_value=0, value=(vessel[3]))
        
        if st.button("Calculate"):
            customs_fee = calculate_customs(vessel_weight, shipment_weight, shipment_cost)
            st.write(f"Total Customs Fee: ${customs_fee}")

    elif page == "Custom Queries":
        st.header("Want to write custom queries?")
        
        query = st.chat_input("Your Query:")
        
        if query:
            st.code(query, 'sql')
            report_data = pd.read_sql(query, conn)
            st.write(report_data)

conn.close()
