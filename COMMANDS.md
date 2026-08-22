# Lab Report LaTeX Template Documentation

This guide provides detailed instructions for utilizing the custom commands and environments defined within the `labreport` LaTeX class. 

## Header Variables and Setup
Before writing your document content, you must define the header metadata. Place these commands in the preamble (after `\documentclass` but before `\begin{document}`). 

* `\labnum{...}` and `\reportdate{...}`: Define the lab assignment number and submission date.
* `\tablenum{...}` and `\labroomnum{...}`: Define your physical lab location details.
* `\studentone{Name}{Roll}` and `\studenttwo{Name}{Roll}`: Each command requires two arguments to input the full name and roll number of the respective group member.

To generate the grid-aligned header at the top of your PDF, invoke the `\makeheader` command immediately after `\begin{document}`.

## Structuring the Report
Use the following environments and commands to build the body of your report. Each environment automatically generates a grey separator line and applies specific typography to the text inside.

* **`\makeexperiment{Number}{Title}`**: Introduces a new experiment block. It requires the experiment number as the first argument and the descriptive title as the second.
* **`labaim` Environment**: Wraps the objective of the experiment. Text placed inside `\begin{labaim}` and `\end{labaim}` is automatically scaled larger and italicized.
* **`labcomponents` and `labprocedure` Environments**: Designed for listing hardware parts and step-by-step instructions. Standard `itemize` lists work best inside these blocks.
* **`labobservation` Environment**: Wraps standard text and `table` formatting for your truth tables, data paragraphs, and result analysis.

## Adding Media and Links
The template includes specific handlers for simulation screenshots and physical photographs.

* **`\maketklink{URL}{Filename}{Caption}`**: This single command generates both the simulation hyperlink and the screenshot image. It requires three arguments: the full web URL, the local image filename (e.g., `circuit.png` located in the same folder as your `.tex` file), and the text caption for the figure.
* **`labpics` Environment**: Automatically centers all contents placed within it. Use this block to insert standard `\includegraphics` commands for photographs of your assembled breadboard.
