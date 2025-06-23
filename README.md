# tema-mn
MATLAB coursework on audio synthesis, curve interpolation, and recommendation systems using numerical methods.

# MATLAB Coursework: Signal Processing, Interpolation & Recommendations

This repository contains the solutions to three distinct problems, each located in its own subfolder:

## Contents

* [`numerical_music/`](./numerical_music): Digital signal processing & music synthesis
* [`robotzii/`](./robotzii): Polynomial & spline interpolation for 2D trajectory reconstruction
* [`recommendations/`](./recommendations): User-item recommendations based on cosine similarity

---

## `numerical_music/`: Digital Audio Effects and Synthesis

This module explores the generation, transformation, and visualization of audio signals using numerical methods. The main goal is to build musical pieces by programmatically synthesizing instruments and applying effects.

### Key Components:

* `create_sound.m`: Synthesizes music patterns based on predefined structures and instrument parameters.
* `oscillator.m`: Generates basic waveforms (sine, square, triangle) at specific frequencies, used as building blocks for instruments.
* `create_instruments.m`: Defines virtual instruments by combining waveforms with specific weights and modulation techniques.
* `apply_reverb.m`: Applies a simple reverb effect by adding delayed and attenuated signal copies.
* `high_pass.m`: Implements a high-pass filter to attenuate low-frequency components.
* `stereo_to_mono.m`: Mixes stereo signals into a single-channel mono format.
* `plot_spectrogram.m`: Plots the spectrogram to visualize frequency content over time.
* `studio.m`: Central script that assembles sounds, applies effects, and produces output suitable for playback and analysis.

This problem demonstrates how digital signal processing concepts can be used creatively for sound design and analysis.

---

## `robotzii/`: Curve Fitting with Interpolation

This module focuses on fitting a smooth curve through a set of data points extracted from a robot's 2D trajectory. Two techniques are compared: global polynomial interpolation and piecewise cubic spline interpolation.

### Key Components:

* `parse_data.m`: Loads a set of 2D coordinates representing a sampled trajectory.
* `vandermonde.m`: Constructs the Vandermonde matrix used in polynomial interpolation.
* `P_vandermonde.m`: Evaluates the interpolated polynomial at arbitrary points.
* `spline_c2.m`: Computes the coefficients for a natural cubic spline with second-order continuity (C2).
* `P_spline.m`: Evaluates the resulting spline on a dense grid for smooth plotting.
* `plot_vandermonde.m`: Visualizes the original points and the polynomial interpolation.
* `plot_spline.m`: Plots the cubic spline interpolation alongside the input data.

The purpose is to understand the numerical stability and approximation quality of both methods when modeling real-world paths.

---

## `recommendations/`: Recommender System with Cosine Similarity

This module implements a basic content-based recommender system that suggests items to users based on user-user similarity.

### Key Components:

* `read_mat.m`: Loads a matrix of user-item interactions from a file (e.g., ratings or consumption data).
* `preprocess.m`: Normalizes user vectors to ensure fair similarity comparison.
* `cosine_similarity.m`: Computes the cosine similarity between user preference vectors.
* `recommendations.m`: Uses the similarity scores to generate item suggestions for each user based on the preferences of the most similar users.

This approach is commonly used in collaborative filtering systems where user profiles are incomplete or sparse.

---

## How to Run

Each folder includes all scripts required to test and visualize the results. Open MATLAB and run the main script in each directory:

```matlab
% From the root directory:
cd numerical_music
studio

cd ../robotzii
plot_vandermonde
plot_spline

cd ../recommendations
recommendations
```

---

## Requirements

* MATLAB R2021a or newer
* No external toolboxes required (unless specified in individual scripts)

---

## License

This project is for academic and educational purposes.

---
