// 파이어베이스 공통코드 
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.9.0/firebase-app.js";
const firebaseConfig = {
    apiKey: "AIzaSyDegzcOZjxNyw-GY8ATv97gEjHaKFs6HEQ",
    authDomain: "semi-project-7a423.firebaseapp.com",
    databaseURL: "https://semi-project-7a423-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "semi-project-7a423",
    storageBucket: "semi-project-7a423.appspot.com",
    messagingSenderId: "660861448017",
    appId: "1:660861448017:web:640334735d21f4977bed70"
};

export const firebaseApp = initializeApp(firebaseConfig);
console.log(firebaseApp);