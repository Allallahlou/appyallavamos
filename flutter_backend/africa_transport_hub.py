from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List

app = FastAPI(
    title="🏆 Africa 2025 & 2030 Transport Hub | Morocco",
    version="1.0.0"
)

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 🧾 نموذج حجز
class Booking(BaseModel):
    city: str
    transport_type: str
    passenger_name: str
    phone: str
    date: str

# 📍 قاعدة البيانات: كل مدينة + وسائل النقل
TRANSPORT_DB = {
    "Casablanca": {
        "tgv": {"line": "TGV Casa–Tanger", "color": "blue", "icon": "train"},
        "tram": {"lines": ["T1", "T2"], "color": "red", "icon": "tram"},
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "CMN", "color": "green", "icon": "flight"},
        "taxi": {"color": "teal", "icon": "local_taxi"},
    },
    "Rabat": {
        "tgv": {"line": "TGV Rabat–Tanger", "color": "blue", "icon": "train"},
        "tram": {"lines": ["T1", "T2"], "color": "red", "icon": "tram"},
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "RBA", "color": "green", "icon": "flight"},
    },
    "Tangier": {
        "tgv": {"line": "TGV Tanger–Casablanca", "color": "blue", "icon": "train"},
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "TNG", "color": "green", "icon": "flight"},
        "port": {"name": "Tanger Med", "color": "indigo", "icon": "directions_boat"},
    },
    "Marrakech": {
        "tgv": {"line": "TGV Casa–Marrakech (2027)", "color": "blue", "icon": "train"},
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "RAK", "color": "green", "icon": "flight"},
        "tram": {"lines": ["T1"], "color": "red", "icon": "tram"},
    },
    "Agadir": {
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "AGA", "color": "green", "icon": "flight"},
    },
    "Fes": {
        "tgv": {"line": "TGV Tanger–Fes", "color": "blue", "icon": "train"},
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "FEZ", "color": "green", "icon": "flight"},
    },
    "Oujda": {
        "oncf": {"line": "Oujda–Fes", "color": "green", "icon": "directions_railway"},
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "OUD", "color": "green", "icon": "flight"},
    },
    "Beni Mellal": {
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "BEM", "color": "green", "icon": "flight"},
    },
    "Tetouan": {
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "TTU", "color": "green", "icon": "flight"},
    },
    "Laayoune": {
        "ctm": {"color": "amber", "icon": "directions_bus"},
        "airport": {"code": "EUN", "color": "green", "icon": "flight"},
    }
}

# 🌍 نقطة نهاية: كل المدن
@app.get("/cities")
def list_cities():
    return list(TRANSPORT_DB.keys())

# 🚍 نقطة نهاية: وسائل نقل مدينة معيّنة
@app.get("/cities/{city}")
def city_transports(city: str):
    if city not in TRANSPORT_DB:
        raise HTTPException(404, "City not found")
    return TRANSPORT_DB[city]

# 🎫 نقطة نهاية: إضافة حجز
@app.post("/book")
def book_transport(booking: Booking):
    return {
        "status": "success",
        "message": f"✅ تم حجز {booking.transport_type} في {booking.city} لـ {booking.passenger_name}",
        "details": booking
    }

# 🧪 نقطة اختصار صحة السيرفر
@app.get("/")
def root():
    return {"message": "🏆 Africa 2025 & 2030 Transport Hub API is live!"}