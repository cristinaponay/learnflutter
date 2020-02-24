import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF473273))),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xFF6C45BF),
  )),
);

const textTitleField = TextStyle(fontSize: 18, color: Color(0xFF6C45BF));
const multiCategories = [
  {
    'display': '+Physiological',
    'value': '+Physiological',
  },
  {
    'display': '+Safety', 
    'value': '+Safety', 
  },
  {
    'display': '+Belonging', 
    'value': '+Belonging', 
  },
  {
    'display': '+Esteem', 
    'value': '+Esteem', 
  },
  {
    'display': '+Cognitive', 
    'value': '+Cognitive', 
  },
  {
    'display': '+Aesthetic',  
    'value': '+Aesthetic',  
  },
  {
    'display': '+Self-Actualization', 
    'value': '+Self-Actualization', 
  },
  {
    'display': '+Transcendence',  
    'value': '+Transcendence',  
  },
  {
    'display': '-Physiological',
    'value': '-Physiological',
  },
  {
    'display': '-Safety', 
    'value': '-Safety', 
  },
  {
    'display': '-Belonging', 
    'value': '-Belonging', 
  },
  {
    'display': '-Esteem', 
    'value': '-Esteem', 
  },
  {
    'display': '-Cognitive', 
    'value': '-Cognitive', 
  },
  {
    'display': '-Aesthetic',  
    'value': '-Aesthetic',  
  },
  {
    'display': '-Self-Actualization', 
    'value': '-Self-Actualization', 
  },
  {
    'display': '-Transcendence',  
    'value': '-Transcendence',  
  },
];
