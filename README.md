# User-Independent MC-SVM Hand-Gesture Recognition for Powered Wheelchair Control

Research code associated with the journal article **“Electric powered wheelchair control using user-independent classification methods based on surface electromyography signals”**, published in *Medical & Biological Engineering & Computing*.

**Repository version:** `1.0.0`

This repository preserves the MATLAB research prototype used to investigate surface electromyography (sEMG)-based hand-gesture recognition for electric powered wheelchair (EPW) control, with emphasis on a **user-independent multi-class support vector machine (MC-SVM)** classifier.

## Associated paper

Hassam Iqbal, Jinchuan Zheng, Rifai Chai, and Sivachandran Chandrasekaran.  
**Electric powered wheelchair control using user-independent classification methods based on surface electromyography signals.**  
*Medical & Biological Engineering & Computing*, **62**(1), 167–182, 2024.  
DOI: https://doi.org/10.1007/s11517-023-02921-z

The article was published online on 26 September 2023 and appeared in the January 2024 issue.

### Reported study results

The paper compares four machine-learning approaches for five-gesture recognition:

| Method | Reported accuracy |
| --- | ---: |
| Multi-class support vector machine (MC-SVM) | **99.05%** |
| Decision tree (DT) | **97.77%** |
| Regularized linear regression (RLR) | **95.88%** |
| Linear regression (LR) | **94.85%** |

For MC-SVM, the paper reports approximately **99.15% precision**, **98.47% recall**, and **98.81% F1 score**. Six able-bodied participants also completed the real-time wheelchair-control evaluation without collisions under the reported study protocol.

## Research objective

Conventional joystick control can be difficult for people with impaired hand or finger function. This project investigates a wearable human–machine interface in which forearm sEMG signals from a Myo armband are used to recognize a small library of hand gestures and map them to powered-wheelchair commands.

The five gestures and reported command mapping are:

| Gesture | Command |
| --- | --- |
| Fist | Forward |
| Fingers spread | Reverse |
| Wave in | Left |
| Wave out | Right |
| Rest | Stop |

The central contribution of the MC-SVM approach is **user-independent classification**: unlike the user-dependent LR/RLR approaches evaluated in the paper, a new user is intended to operate the trained classifier after device calibration without retraining the model on that individual.

## Repository contents

All original research artifacts are preserved under `DEMOMC-SVM/`.

| File | Purpose |
| --- | --- |
| `Demo_SVM.m` | Main archived real-time MC-SVM demonstration script using Myo/MyoMex acquisition and a pretrained classifier. |
| `dataprocessing.m` | MATLAB preprocessing class containing z-score normalization and RMS feature extraction utilities. |
| `interface_new1.m` | Visual directional/stop interface used for real-time gesture-control feedback. |
| `hassammmm.m` | Exploratory/visualization script for gesture-labelled training data. |
| `model.mat`, `model1165NEW.mat` | Archived trained MATLAB model artifacts. |
| `cvmodel.mat` | Archived cross-validated classifier artifact. |
| `accuracy.mat`, `cmat.mat`, `genError.mat` | Saved evaluation outputs. |
| `train_labels*.mat`, `trainlabels_strong.mat` | Archived gesture-label artifacts. |
| `trainvec1165.mat`, `trainvec_strong.mat` | Archived training-vector artifacts. |

## Signal processing and experimental context

The published methodology used a Myo armband with eight dry sEMG electrodes. The paper reports sEMG acquisition at **200 Hz**, DC-offset removal, z-score normalization, and root-mean-square (RMS) feature extraction using **200 ms overlapping windows updated every 40 ms**.

The archived `dataprocessing.m` class contains a 200 ms window, z-score normalization, and RMS extraction implementation. Its current default update interval is 100 ms, so the archive should be interpreted as research-development code rather than a byte-for-byte executable reconstruction of every parameter reported in the final publication.

## Running the archived demo

The repository is an archival research prototype, not a turnkey software package. The real-time workflow requires at minimum:

- MATLAB;
- a compatible Myo armband;
- the Myo SDK / MATLAB `MyoMex` interface used by the original project; and
- a compatible operating-system and device-driver environment.

The archived entry point is:

```matlab
cd('DEMOMC-SVM')
Demo_SVM
```

### Important archival dependency note

`Demo_SVM.m` currently references two files named `trainlabel_NEW.mat` and `model_NEW.mat`. Those exact filenames are **not present in this repository**; the archive contains related label and model artifacts under different names. The original source has been preserved rather than silently guessing which binary artifact should be substituted.

Accordingly, users attempting to recreate the live demonstration may need to identify or regenerate the exact classifier/label artifacts used by the final experimental setup and adapt the load statements to their local environment.

## Reproducibility scope

This repository preserves the available MATLAB scripts and trained artifacts associated with the research project. It does **not** contain participant-level raw sEMG recordings, the complete original data-acquisition environment, or a fully pinned software/hardware stack. The reported performance values should therefore be taken from the peer-reviewed paper rather than assumed to be reproduced simply by running the archived files.

The repository also contains binary MATLAB model/data artifacts. These are retained for provenance and research traceability; they should not be interpreted as independently validated production models.

## Safety and intended use

> **Research prototype only.** Do not deploy this code as a safety-critical mobility controller without independent engineering validation, fail-safe design, hazard analysis, human-factors assessment, appropriate clinical evaluation, and compliance with applicable medical-device and powered-mobility requirements.

The study was evaluated experimentally under a controlled research protocol. That does not establish clinical or regulatory readiness for unsupervised wheelchair operation.

## Citation

If you use this repository, implementation, or methodology in academic work, please cite the associated article:

> Iqbal, H., Zheng, J., Chai, R., & Chandrasekaran, S. (2024). Electric powered wheelchair control using user-independent classification methods based on surface electromyography signals. *Medical & Biological Engineering & Computing, 62*(1), 167–182. https://doi.org/10.1007/s11517-023-02921-z

### BibTeX

```bibtex
@article{iqbal2024electric,
  author  = {Iqbal, Hassam and Zheng, Jinchuan and Chai, Rifai and Chandrasekaran, Sivachandran},
  title   = {Electric powered wheelchair control using user-independent classification methods based on surface electromyography signals},
  journal = {Medical \& Biological Engineering \& Computing},
  year    = {2024},
  volume  = {62},
  number  = {1},
  pages   = {167--182},
  doi     = {10.1007/s11517-023-02921-z}
}
```

A machine-readable `CITATION.cff` file is included so GitHub can expose a **Cite this repository** action.

## Article license versus code license

The Springer article is published open access under the **Creative Commons Attribution 4.0 International (CC BY 4.0)** license. That article license does not automatically assign the same software license to this repository.

No open-source software license has been assigned to the archived code here. Unless the code copyright holders explicitly select a software license, the source remains subject to default copyright protections.

## Authors

- Hassam Iqbal
- Jinchuan Zheng
- Rifai Chai
- Sivachandran Chandrasekaran

For research questions, use the corresponding-author information in the published paper or open a GitHub issue.