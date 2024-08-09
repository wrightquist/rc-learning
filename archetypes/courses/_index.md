---
date: "{{ time.Now.Format "2006-01-02" }}"
title: "{{ replace (replace .File.ContentBaseName `-` ` `) `_` ` ` | title }}"
summary: ""
authors: []
categories: []
weight: 100
---

**hello world!**  
this is the first page of your course
