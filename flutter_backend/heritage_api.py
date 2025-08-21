# heritage_api.py
from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Optional

app = FastAPI(title="Morocco Heritage API")

# CORS للـ Flutter
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# قاعدة البيانات (يمكن استبدالها بـ DB حقيقي لاحقًا)
HERITAGE_SITES = [
    {
        "id": 1,
        "name": "فاس البالي",
        "city": "فاس",
        "image": "images/fes_bali.png",   
        "desc": "أقدم مدينة إسلامية حية، مدرجة منذ 1981.",
        "icon": "castle",
        "lat": 34.0611,
        "lng": -4.9778,
        "map": "https://maps.apple.com/?q=Fes+Bali+Morocco"
    },
    {
        "id": 2,
        "name": "جامع الفنا",
        "city": "مراكش",
        "image": "images/jemaa_fna.png",
        "desc": "ساحة الشعب والفنون الشعبية، تراث إنساني.",
        "icon": "groups",
        "lat": 31.6258,
        "lng": -7.9891,
        "map": "https://maps.apple.com/?q=Jemaa+El+Fna+Marrakech"
    },
    {
        "id": 3,
        "name": "قصبة الأوداية",
        "city": "الرباط",
        "image": "images/oudaya.png",
        "desc": "حصن أندلسي يطل على نهر أبي رقراق.",
        "icon": "fort",
        "lat": 34.0340,
        "lng": -6.8365,
        "map": "https://maps.apple.com/?q=Kasbah+Oudaya+Rabat"
    },
    {
        "id": 4,
        "name": "كهوف هيرقليون",
        "city": "طنجة",
        "image": "images/hercules.png",
        "desc": "كهوف أسطورية تفتح على المحيط الأطلسي.",
        "icon": "waves",
        "lat": 35.7776,
        "lng": -5.8037,
        "map": "https://maps.apple.com/?q=Hercules+Caves+Tangier"
    },
    {
        "id": 5,
        "name": "قلعة أكادير",
        "city": "أكادير",
        "image": "images/agadir_kasbah.png",
        "desc": "قلعة تاريخية تشرف على مدينة أكادير.",
        "icon": "temple_buddhist",
        "lat": 30.4211,
        "lng": -9.6010,
        "map": "https://maps.apple.com/?q=Agadir+Kasbah"
    },
    {
        "id": 6,
        "name": "مسجد الحسن الثاني",
        "city": "الدار البيضاء",
        "image": "images/hassan2.png",
        "desc": "ثالث أكبر مسجد في العالم، معلمة عالمية.",
        "icon": "mosque",
        "lat": 33.6078,
        "lng": -7.6327,
        "map": "https://maps.apple.com/?q=Hassan+II+Mosque+Casablanca"
    }
]

# Endpoints
@app.get("/heritage")
def list_sites(q: Optional[str] = Query(None)):
    """جميع المواقع أو بحث بالاسم أو المدينة"""
    if q:
        return [s for s in HERITAGE_SITES if q.lower() in s["name"].lower() or q.lower() in s["city"].lower()]
    return HERITAGE_SITES

@app.get("/heritage/{site_id}")
def site_details(site_id: int):
    site = next((s for s in HERITAGE_SITES if s["id"] == site_id), None)
    if not site:
        raise HTTPException(status_code=404, detail="Site not found")
    return site

@app.get("/")
def root():
    return {"message": "🏛️ Morocco Heritage API – Africa 2025"}