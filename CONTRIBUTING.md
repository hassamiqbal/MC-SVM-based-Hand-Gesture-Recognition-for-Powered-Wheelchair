# Contributing

This repository is primarily an archival research-code record associated with a peer-reviewed publication. Contributions that improve documentation, reproducibility, compatibility, or clearly isolated research utilities are welcome, provided they do not silently alter the historical experimental implementation.

## Before contributing

Please open an issue describing the proposed change, particularly for changes involving:

- model behavior or classifier configuration;
- signal-processing parameters;
- Myo/MyoMex compatibility;
- powered-wheelchair control interfaces;
- replacement or regeneration of binary `.mat` artifacts; or
- claims about reproducing published performance.

## Research integrity

When modifying or extending the code:

- distinguish historical/original code from new implementation work;
- document any change to preprocessing, feature extraction, class labels, validation, or model hyperparameters;
- do not overwrite archived evaluation/model artifacts without preserving provenance;
- do not report published performance as reproduced unless it has actually been independently reproduced; and
- cite the associated article when using the methodology in academic work.

## Data and privacy

Do not commit participant-level sEMG recordings, identifiable participant information, consent forms, or other restricted research data. Any newly collected human-participant data must be governed by appropriate ethics approval, consent, and institutional data-management requirements.

## Safety-critical changes

This code concerns powered mobility. Contributions that connect predictions to physical wheelchair actuation must be treated as safety-critical research changes. Such work should include appropriate fail-safe behavior, command bounds, emergency-stop mechanisms, validation, hazard analysis, and supervised testing.

A pull request to this repository does not constitute clinical, regulatory, or safety approval.

## Code style

For MATLAB changes:

- use descriptive variable and function names;
- add comments where assumptions are not obvious;
- avoid introducing machine-specific absolute paths;
- separate data acquisition, preprocessing, inference, and actuation logic where practical; and
- state the MATLAB/toolbox version when a new dependency is introduced.

## Citation

Please see `CITATION.cff` and the README for the preferred citation.