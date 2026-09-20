# Design System Manifest: TamHizmet.app

This document defines the visual language, design tokens, and component architecture for TamHizmet.app, intended for use with **Google Stitch** and development implementation.

## 1. Brand Identity & Vibe

*   **Vibe:** Modern, Professional, Trustworthy, Clean.
*   **Target:** Dual-sided marketplace (Service Seekers & Service Professionals).
*   **Concept:** Seamless connection. The interface should feel invisible, focusing on the clarity of tasks and communication.

---

## 2. Design Tokens

### 2.1 Color Palette
Primary brand identity is defined by a vibrant Turquoise.

| Token | Role | HEX | Usage |
|---|---|---|---|
| `primary` | Brand Identity | `#00C4B5` | Main buttons, active states, branding elements. |
| `primary-variant` | Accent | `#17C3B2` | Gradients, hover states. |
| `bg-light` | Surface (Light) | `#F8F9FA` | Main background for Light Mode. |
| `bg-dark` | Surface (Dark) | `#1E1E1E` | Main background for Dark Mode. |
| `surface` | Card/Elevated | `#FFFFFF` | Card backgrounds in light mode. |
| `surface-dark` | Card/Elevated | `#2B2B2B` | Card backgrounds in dark mode. |
| `text-primary` | Main Text | `#212529` | Headlines and body text. |
| `text-secondary` | Muted Text | `#6C757D` | Captions, labels, helper text. |
| `error` | Warning | `#DC3545` | Validation errors, destructive actions. |

### 2.2 Typography
*   **System Font:** Inter or Roboto.
*   **Headlines:** Semi-bold, tight letter spacing.
*   **Body:** Regular, generous line height (1.5) for readability.

### 2.3 Spacing & Radius
*   **Base Unit:** 4px.
*   **Grid:** 8px increments (8, 16, 24, 32, 48, 64).
*   **Radius:**
    *   `sm`: 4px (Inputs)
    *   `md`: 12px (Small Cards)
    *   `lg`: 24px (Main Containers, Bottom Sheets)

---

## 3. Component Architecture

### 3.1 Buttons
*   **Primary:** Solid Turquoise, White text, rounded corners (24px).
*   **Secondary:** Outlined Turquoise, Transparent background.
*   **Disabled:** Light gray background, Muted text.

### 3.2 Cards (Marketplace Style)
*   **Request Card:** White/Dark Gray background, subtle 1px border (`outlineVariant`), summary of the task (Category, Date, Location).
*   **Quote Card:** Elevated primary color accent for "Best Value" or "Promoted" providers.

### 3.3 Dynamic Forms
*   **Inputs:** Minimalist style, clear labels, focus state uses Primary Turquoise border (2px).
*   **Selection:** `RadioListTile` and `CheckboxListTile` use Primary Turquoise for active markers.

---

## 4. Module-Specific Theming

While the brand is unified, subtle cues differentiate the modules:

*   **Tam Hizmet Al (Customer):** Focus on simplicity. Icons are softer, rounded. Primary accent is consistent.
*   **Tam Hizmet Ver (Provider):** Focus on utility and data. Layouts can be more information-dense. Accents remain Turquoise but might use stronger Dividers to separate tasks.

---

## 5. Stitch Prompting Guidelines

When using **Google Stitch** to generate new screens for this project, ensure the following prompt context is used:

> "Generate a UI following the `DESIGN.md` manifest for a service marketplace app. Use Primary Turquoise (#00C4B5) for all interactive elements. Background must be #F8F9FA. Ensure Material 3 component logic."

---

## 6. Layout & Responsiveness
*   **Mobile:** Single column, focused actions.
*   **Web Desktop:** Multi-pane layouts (e.g., Search on left, Details on right).
*   **Overlay Blocker:** Web screens < 600px width must trigger the system-wide overlay redirecting to the mobile app.
