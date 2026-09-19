# Snowflake-AI

A data engineering and Generative AI project built using Snowflake, LangChain, RAG, and local LLMs.

## Overview

This project uses the Olist Brazilian E-Commerce dataset for structured data analysis and combines it with document-based RAG for unstructured data.

### Structured Data

This project uses the [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

- Olist data stored and analyzed in Snowflake
- LangChain SQL Agent for natural-language SQL queries
- Automatic table and schema discovery

### Unstructured Data
- PDF and text documents
- `nomic-embed-text` embeddings
- Chroma vector database
- RAG-based question answering

## Architecture

```text
Olist CSVs → Snowflake → SQL Agent → Qwen3:4b

PDFs / Text → Embeddings → Chroma → RAG → Qwen3:4b
