import streamlit as st

st.title("Hello 👋")
st.markdown(
    """ 
    Sample streamlit app
    """
)

if st.button("Send balloons!"):
    st.balloons()
