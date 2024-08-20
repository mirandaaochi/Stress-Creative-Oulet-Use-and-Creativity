# Research and Data Analysis in Psychology Final Project: Stress, Creative Outlet Use, and Creativity

## Executive Summary

This was a final project and research paper completed for Psychology 101: Research and Data Analysis in Psychology, in which students conducted our own research studies. 

The purpose of my study was to determine the effect of stress and the use of dance as a creative outlet on creativity.

Using Google Forms, I administered a self-report survey that included demographic questions, self-description of extracurriculars/jobs they are involved in and how many hours a week these activities take up, self-description of time spent dancing each week, and Likert scale questions regarding their stress levels, creativity, and use of dance as creative outlet.

Then, I took to RStudio to explore the relationships between stress, dance as a creative outlet, and creativity using a series of linear regression models.

## Problem

It can be thought that stress hinders creativity, but the use of creative outlets can also be seen as a form of stress-relief. This research project aims to observe the relationship between stress, dance as a creative outlet, and creativity. 

In this study, **creativity is the dependent variable**. Creativity is defined by the American Psychological Association as “the ability to produce or develop original work, theories, techniques, or thoughts,” with a creative individual being someone who “typically displays originality, imagination, and expressiveness.” 

**The first independent variable is stress.** As the World Health Organization notes, stress is “a state of worry or mental tension caused by a difficult situation.” 

**The second independent variable is creative outlet use**, specifically surrounding dance. A creative outlet can be defined as an activity that is done to express ourselves in a creative manner. 

This study advances past research by narrowing in on the use of creative outlets and observing the ways in which dance-related creativity is related to stress. Specific predictions (hypotheses) that I hold are as follows in the table below.

![Screenshot 2024-08-20 at 1 41 41 PM](https://github.com/user-attachments/assets/241c4917-25e2-4780-a287-fb367227100f)


## Methodology

1. Create a self-report survey and collect responses through a Google Form.

2. Clean the data and create variables based on responses. These included STRESS, COU (Creative Outlet Use), and CREATIVITY.

3.  Analyze the data using linear regression models.

## Skills

Google Forms: data collection

Google Sheets: data transformation (scaling), data cleaning

R (RStudio): hypothesis testing, linear regression

## Results

**Variable Descriptive Statistics**

![Screenshot 2024-08-20 at 1 41 58 PM](https://github.com/user-attachments/assets/b002c6b8-1b7e-4d80-a4ba-0e50ef10b829)

The histogram for CREATIVITY is skewed right, with an alpha reliability of 0.6, which tells us that the items in this measure of creativity aren’t quite the best in terms of consistency. The mean is 2.18, the sd is 0.72, and the range is 1 to 3.5, so the data isn’t super spread out.

The histogram for STRESS is more normally distributed than outwardly skewed. The alpha reliability in this case is 0.73, which tells us that the items in this measure of stress are okay in terms of consistency. The mean is 2.98, the sd is .49, and the range is 2 to 3.5, meaning the data is closely distributed around the mean.

The histogram for CREATIVE OUTLET USE is quite spread out and is a little harder to see a distribution for. The alpha reliability in this case is 0.91, which tells us that the items in this measure of dance creative outlet use are good in terms of consistency. The mean is 2.68, the sd is 1.08, and the range is 0.83 to 4.33. The range of this distribution is much bigger compared to the ranges of the other distributions, and this is reflected in the other statistics as well.

**Hypothesis Testing**

![Screenshot 2024-08-20 at 1 42 09 PM](https://github.com/user-attachments/assets/f425fa8d-7c7c-4e72-a153-b7d08a6ab5ca)

Hypothesis 1 (creativity ~ stress)

The null hypothesis was that stress has a positive effect or no effect on creativity. To test this hypothesis, I used a model that looked at the relationship between CREATIVITY (DV) and STRESS (IV1) (Model 1). The following statistics were observed: β = 0.43, 95% CI = [-0.48, 1.34], t = 0.929, p = .38. Based on these statistics, *we fail to reject the null hypothesis and fail to support the alternative hypothesis for Hypothesis 1*.

Hypothesis 2 (creativity ~ creative outlet use)

The null hypothesis was that the use of dance as a creative outlet has a negative effect or no effect on creativity. To test this hypothesis, I used a model that looked at the relationship between CREATIVITY (DV) and CREATIVE OUTLET USE (IV2) (Model 2). The following statistics were observed: β = 0.51, 95% CI = [0.23, 0.46], t = 3.624, p = 0.005). Based on these statistics, *we can reject the null hypothesis and favor the alternative hypothesis for Hypothesis 2*.

Hypothesis 3 (creativity ~ stress + creative outlet use)

The null hypothesis was that stress and creative outlet use have no effect on creativity. To test this hypothesis, I used a multivariate model that looked at the relationship between CREATIVITY (DV), STRESS (IV1), and CREATIVE OUTLET USE (IV2) (Model 3).  The following statistics were observed for STRESS: β = 0.29, 95% CI = [-0.33, 0.90], t = 0.907. Likewise, the following statistics were observed for CREATIVE OUTLET USE: β = 0.49, 95% CI = [0.21, 0.77], t = 3.435. The p-value of the model is 0.018. 

The slope of STRESS in Model 1 was β = 0.43, and the slope of STRESS in Model 3 was β = 0.29. This is a decrease of 0.14 between the models, telling us that the relationship between STRESS and CREATIVITY is weaker when CREATIVE OUTLET USE is involved. Similarly, the slope of CREATIVE OUTLET USE in Model 2 was  β = 0.51, and the slope of CREATIVE OUTLET USE in Model 3 was β = 0.49. This is only a decrease of 0.02 between the models, so the relationship between CREATIVE OUTLET USE and CREATIVITY is only a little bit weaker when STRESS is involved. These changes tell us that there is a mediation effect as the effect of stress is suppressed once creative outlet use is factored in.

In addition, the R2 value (R2 ≈ 0.63) tells us that there is a strong effect on CREATIVITY by STRESS and CREATIVE OUTLET USE, and the correlation coefficient (r ≈ 0.79) displays a strong positive correlation. With the p-value being less than 0.05 at the 95% significance level, *we can reject the null hypothesis and favor the alternative hypothesis for Hypothesis 3*.

![Screenshot 2024-08-20 at 1 42 25 PM](https://github.com/user-attachments/assets/b0e85757-d0af-48af-95c7-e1f759edef04)


**Key Takeaways**

This study found that there were positive relationships between stress and creativity as well as creative outlet use and creativity, with only the latter relationship being statistically significant. A multivariate model found that creative outlet use did have a statistically significant mediating effect on the relationship between stress and creativity. 

**Limitations**

Even though positive associations between stress, creative outlet use, and creativity were found, this study does not provide statistically significant evidence of stress being positively related to creativity or having no effect on creativity. One of the biggest limitations of this study was sampling error, meaning that both sample size and sample selection were inadequate in generating meaningful results.

Another limitation was in the scales used to quantify stress, creative outlet use, and creativity. The survey’s administration as a self-report survey could lead to biased or inaccurate results, especially regarding questions about busyness and hours spent in extracurricular activities/jobs. To mitigate this in the future, perhaps more specific questions that do not overlap between variables could be used. 

## Next Steps

1. Use a larger, more diverse sample of participants in order to understand if this study may be statistically significant and generalizable to all.

2. Explore the direct effect of stress on creativity and creative outlet use.



