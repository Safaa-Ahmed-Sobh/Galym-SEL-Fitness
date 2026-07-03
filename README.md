# Galym SEL Fitness Management System 🏋️‍♂️📊

An enterprise database architecture built to streamline operations, staff workflows, trainee tracking, and contract plan management for a commercial fitness center. The system maps operational requirements into a robust relational model to prevent data fragmentation, optimize query performance, and ensure relational integrity.

---

## 👑 My Role: Team Leader & Relational Architect

This project was developed by a collaborative group of four student engineers. As the **Team Leader**, I synchronized our structural project deadlines, managed our design pipeline distribution, and directed our presentation frameworks. On the technical layer, I owned the core structural architecture, logical table mapping, and advanced programmatic script layers of the database lifecycle. 

My specific engineering contributions include:
* **ER Schema Mapping:** Co-designed the baseline Entity-Relationship model, determining exact system structural bounds, attributes, and key constraints.
* **Trainee Subsystem Implementation:** Engineered the primary core data storage structures, building the `trainee` table schemas, data type validations, and primary identity parameters.
* **Analytical Queries & Script Layer:** Authored and optimized the entire programmatic SQL suite, executing basic selection filters, multi-table aggregate groupings, cross-relational `LEFT`/`RIGHT` joins, complex subqueries, and decoupled virtual system `VIEW` spaces.

---

## 📁 Repository Structure

* `/src/schema.sql` — Full production-ready SQL initialization scripts containing DDL configurations, constraints, data insertions, and analytical query layers.
* `/docs/` — Comprehensive engineering project report outlining logical ER diagrams, relational dependencies, mapping matrices, and verified output results.

---

## 🧩 Architectural Database Blueprint

The relational schema maps out real-world gym operations across four tightly integrated pipelines:
1. **Staff Tracking:** Centralizes employee payroll data, profiles, contact keys, and performance audits.
2. **Trainee Metrics:** Manages biometric logs (height, weight), structural profiles, and unique subscription constraints.
3. **Membership Administration:** Enforces contract bounds (`trial`, `monthly`, `yearly`) using auto-validating temporal date checks.
4. **Interaction Mapping:** A decoupled bridge entity logging real-time operational interfaces between staff members and trainees.

---

## 🛠️ Tech Stack & Database Standards

* **Engine:** MySQL / Relational Database Management System (RDBMS)
* **Modeling Standards:** Structured ER Diagramming, Unified Schema Formats
* **Target Features Built:** Relational Joins, Aggregations, Nested Queries, Virtual Views

---
*Collaborative Database Management project developed at Umm Al-Qura University.*
