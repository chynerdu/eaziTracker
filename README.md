# eazytracker

A demo flutter mobile application for tracking expenses.

All Data in this project is hardcoded and not connected to any API endpoint

## Getting Started

APK can be located in

- [https://drive.google.com/file/d/1L8P0re6u4gSbjEgqx1moEuT00OKISM6v/view?usp=sharing](https://drive.google.com/file/d/1L8P0re6u4gSbjEgqx1moEuT00OKISM6v/view?usp=sharing)

Important Components

## ExpenseGraphOverview

file located in lib/components/expenseGraphOverview.dart

- [Code here:](https://github.com/chynerdu/eaziTracker/blob/main/lib/components/expenseGraphOverview.dart)

This component contains a TabView containing the two charts: Line Graph and Bar charts respectively

## OverTimeChart

file located in lib/components/overTimeLineChart.dart

- [Code here:](https://github.com/chynerdu/eaziTracker/blob/main/lib/components/overTimeLineChart.dart)

This components plots a line graph showing users expenses within a period of time using:

- [charts_flutter package](https://pub.dev/packages/charts_flutter)
- [See chart Documentation for supported chart](https://google.github.io/charts/flutter/gallery.html)

## ExpenseCategoryChart

file located in lib/components/categoryBarChart.dart

- [Code here:](https://github.com/chynerdu/eaziTracker/blob/main/lib/components/categoryBarChart.dart)

## Budget

file located in lib/screens/budget.dart

- [Code here:](https://github.com/chynerdu/eaziTracker/blob/main/lib/screens/budget.dart)

This component shows a list of user's budgets, and a bottomsheet to create new budget

This components plots a bar showing users expenses based on categories:

- [charts_flutter package](https://pub.dev/packages/charts_flutter)
- [See chart Documentation for supported chart](https://google.github.io/charts/flutter/gallery.html)

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
