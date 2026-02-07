# Pulse Radar Range and Doppler Simulation (MATLAB)

## 📌 Overview
This project demonstrates a **pulse radar system simulation** implemented in MATLAB.  
It estimates the **target range**, analyzes the **Doppler frequency shift** caused by target motion, and performs **target detection using a matched filter**.

The simulation is implemented **without using any specialized MATLAB toolboxes**, making it ideal for **academic learning, NPTEL coursework, and core ECE projects**.

---

## 🎯 Objectives
- Generate a rectangular radar pulse  
- Simulate echo return from a target at a given range  
- Introduce Doppler shift due to target velocity  
- Detect the target using matched filtering  
- Estimate target range and range resolution  

---

## ⚙️ Radar Parameters
| Parameter | Symbol | Value |
|-----------|--------|-------|
| Speed of light | \(c\) | \(3 x 10^8\) m/s |
| Carrier frequency | \(f_c\) | 5 GHz |
| Pulse width | \(T_p\) | 10 µs |
| Sampling frequency | \(f_s\) | 1 MHz |
| Target range | \(R\) | 1500 m |
| Target velocity | \(v\) | 30 m/s |

---

## 📐 Radar Theory & Formulae
- **Round-trip time delay**  
τ = 2R / c

- **Range estimation**  
  R = (c τ) / 2

- **Range resolution (pulse radar)**  
 ΔR = (c Tp) / 2

- **Doppler frequency shift**  
 ΔR = (c Tp) / 2

- **Matched filter (discrete-time)**  
  h[n] = s*[N − n]

- **Delay in samples**  
Nd = τ fs

- **Target detection (peak location)**  
 n_peak = arg max |y[n]|
---

## 📊 Simulation Output
The MATLAB script generates:
1. Transmitted radar pulse  
2. Received signal with time delay and Doppler shift  
3. Matched filter output showing the detection peak  
4. Doppler spectrum of the received signal  

---

## ▶️ How to Run
1. Clone or download the repository.  
2. Open the MATLAB script `pulse_radar_sim.m`.  
3. Run the script to generate plots and detection results.  

---

## 📌 Applications
- Academic coursework (NPTEL, ECE labs)  
- Understanding pulse radar fundamentals  
- Signal processing and matched filter design  
- Doppler analysis for moving targets  

---

## 👩‍💻 Author
K. Deepa vastala
