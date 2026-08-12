# Reproducibility Notes

This repository is an archival research-code snapshot associated with the article:

> Iqbal, H., Zheng, J., Chai, R., & Chandrasekaran, S. (2024). *Electric powered wheelchair control using user-independent classification methods based on surface electromyography signals*. Medical & Biological Engineering & Computing, 62(1), 167–182. https://doi.org/10.1007/s11517-023-02921-z

## What is preserved

The `DEMOMC-SVM/` directory contains:

- the archived live MC-SVM demonstration script;
- sEMG preprocessing/RMS feature-extraction utilities;
- the directional/stop visualization interface;
- exploratory training-data visualization code;
- trained MATLAB model artifacts;
- a cross-validated model artifact;
- saved accuracy, confusion-matrix, and generalization-error artifacts; and
- archived training-label and training-vector MAT files.

## What is not included

The repository does not contain:

- participant-level raw sEMG recordings;
- the complete original acquisition computer/environment;
- a pinned MATLAB/Myo SDK/MyoMex dependency manifest;
- the exact `trainlabel_NEW.mat` file referenced by `Demo_SVM.m`; or
- the exact `model_NEW.mat` file referenced by `Demo_SVM.m`.

Related label and model artifacts are present under other filenames, but the original source is intentionally preserved rather than modifying the experiment based on an unverified binary-file mapping.

## Published methodology versus archived implementation

The paper reports acquisition at 200 Hz, DC-offset removal, z-score normalization, and RMS features computed over 200 ms overlapping windows updated every 40 ms.

The archived `dataprocessing.m` class contains z-score normalization, RMS extraction, and a 200 ms window, but its current default interval is 100 ms. The archived `Demo_SVM.m` also contains development-specific settings and direct construction of the online test vector. These differences indicate that the repository is best treated as a provenance archive of the research-development code rather than a fully frozen reproduction package for the final manuscript configuration.

## Binary model artifacts

The repository includes MATLAB `.mat` files containing trained/classification artifacts. Their retention supports provenance, but no claim is made that every artifact corresponds uniquely to the final model reported in each table or figure of the paper.

## Reproducing the publication

A rigorous independent reproduction would require, at minimum:

1. a compatible Myo armband and acquisition stack;
2. MATLAB and a working MyoMex/Myo SDK interface;
3. participant data collected under appropriate ethics approval and consent;
4. the preprocessing and RMS configuration reported in the paper;
5. reconstruction or verification of the exact MC-SVM training dataset and classifier configuration; and
6. evaluation using the same user-independent experimental design and performance metrics.

Reported numerical results should be taken from the peer-reviewed article unless independently reproduced under a documented protocol.

## Safety

Reproduction of the classification experiment should be separated from uncontrolled powered-wheelchair deployment. Any mobility-control testing requires appropriate engineering controls, supervision, fail-safe mechanisms, risk assessment, and institutional approvals.