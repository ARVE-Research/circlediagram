# GMT plotting scripts and sample data for circle diagrams

This repository contains shell scripts, a helper program, and sample data for plotting the output of a historical land use model in the form of "circle diagrams". The circle diagram concept is introduced in Kay and Kaplan (2015) and described in detail in Hughes et al. (2018).

The sample data included here accompany the paper by Findley et al. (in press).

The following software is required to plot these diagrams:
1. A fortran compiler to compile the helper program parsedata.f90 such as [gfortran](https://gcc.gnu.org/wiki/GFortran).
2. The [Generic Mapping Tools](https://www.generic-mapping-tools.org) graphics package.

**References**

Findley, D. M., Acabado, S., Amano, N., Kay, A. U., Hamilton, R., Barretto-Tesoro, G., Bankoff, G., Kaplan, J. O., & Roberts, P. R. (in review). Land use change in a pericolonial society: Intensification and diversification in Ifugao, Philippines between 1570 and 1800 CE. Frontiers in Earth Science. 

Hughes, R., Weiberg, E., Bonnier, A., Finné, M., & Kaplan, J. (2018). Quantifying Land Use in Past Societies from Cultural Practice and Archaeological Data. Land, 7(1), 9. doi:10.3390/land7010009

Kay, A. U., & Kaplan, J. O. (2015). Human subsistence and land use in sub-Saharan Africa, 1000 BC to AD 1500: A review, quantification, and classification. Anthropocene, 9, 14-32. doi:10.1016/j.ancene.2015.05.001
