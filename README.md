<div align="center">

# 🌱 Giorgio's Digital Garden 🌱

### *Where knowledge grows, thoughts bloom, and ideas flourish*

[![MkDocs Material](https://img.shields.io/badge/MkDocs-Material-526CFE?style=for-the-badge&logo=materialformkdocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)
[![Python](https://img.shields.io/badge/Python-3.12+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Azure DevOps](https://img.shields.io/badge/Azure-DevOps-0078D7?style=for-the-badge&logo=azuredevops&logoColor=white)](https://dev.azure.com/)
[![Live Site](https://img.shields.io/badge/🌐_Live-digitalgarden.maggiolo.net-4CAF50?style=for-the-badge)](https://digitalgarden.maggiolo.net/)

</div>

---

## 🎯 What is This?

Welcome to my **Digital Garden** - a living, breathing knowledge repository where I cultivate my thoughts, experiences, and learnings in IT, aviation, gaming, and beyond! 🚀

Unlike a traditional blog where posts are frozen in time, this garden is **continuously evolving**. Articles here are:
- 🌱 **Planted** as seedlings (drafts)
- 🌿 **Growing** and maturing (work in progress)
- 🌳 **Flourishing** as complete knowledge trees (done, but still tended)

This is **learning in public** - raw, authentic, and iterative.

---

## ✨ What You'll Find Here

🔧 **IT & Technologies**
- Cloud platforms (Azure, AWS)
- Network architecture (Mikrotik, Fortinet, Ubiquiti)
- DevOps & automation
- Infrastructure as Code

✈️ **Aviation**
- Passion for flight and aerospace
- Aviation technology and systems

🎮 **Gaming**
- Video game insights and experiences
- Gaming culture and tech

📚 **Personal Lab**
- Experiments and home lab setups
- Technical deep-dives and how-tos

---

## 🚀 Quick Start

### Prerequisites

Before you begin, ensure you have:
- **Python 3.12+** installed
- **pipx** for isolated Python application management
- **System libraries** (for social card generation):
  ```bash
  sudo apt-get install -y libcairo2-dev libfreetype6-dev libffi-dev \
                          libjpeg-dev libpng-dev libz-dev
  ```

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/aramilialon/digitalgarden.git
   cd digitalgarden
   ```

2. **Install MkDocs Material with imaging support**
   ```bash
   pipx install "mkdocs-material[imaging]" --include-deps
   ```
   *This includes all dependencies needed for the social plugin to generate beautiful social media cards!*

3. **Build the site**
   ```bash
   mkdocs build
   ```
   
4. **Serve locally for development**
   ```bash
   mkdocs serve
   ```
   Visit [http://localhost:8000](http://localhost:8000) to see your local version! 🎉

---

## 🏗️ Tech Stack

This digital garden is built with powerful, modern tools:

| Technology | Purpose |
|------------|---------|
| **[MkDocs](https://www.mkdocs.org/)** | Static site generator |
| **[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)** | Beautiful, responsive theme |
| **[Azure Pipelines](https://azure.microsoft.com/en-us/products/devops/pipelines/)** | CI/CD automation |
| **[Python 3.12](https://www.python.org/)** | Core runtime |
| **Markdown** | Content authoring |

### Special Features
- 🎨 **Custom page status system** - Visual indicators for draft/WIP/done content
- 🌓 **Dark/Light mode** - Automatic theme switching based on system preference
- 🔍 **Full-text search** - Find anything instantly
- 📱 **Mobile-responsive** - Perfect on any device
- 🎯 **Navigation tabs** - Organized, intuitive browsing
- 💬 **Social cards** - Auto-generated preview cards for sharing

---

## 📁 Project Structure

```
digitalgarden/
├── docs/                    # 📄 All content lives here!
│   ├── index.md            # 🏠 Homepage
│   ├── about-me.md         # 👤 About Giorgio
│   ├── digital-garden.md   # 🌱 Philosophy & approach
│   ├── Technologies/       # 🔧 Technical documentation
│   ├── assets/             # 🖼️ Images and logos
│   └── stylesheets/        # 🎨 Custom CSS
├── overrides/              # 🎭 Theme customizations
│   └── partials/           # Custom HTML components
├── mkdocs.yml             # ⚙️ Site configuration
├── azure-pipelines.yml    # 🚀 CI/CD pipeline
└── README.md              # 📖 You are here!
```

---

## 🔄 Deployment

Every commit to `main` triggers an automated deployment pipeline:

1. ✅ Build site with MkDocs
2. 🔐 SSH to remote server
3. 🧹 Clean old content
4. 📦 Deploy fresh build
5. 🎉 Live in seconds!

The magic happens in `azure-pipelines.yml` - fully automated, zero-touch deployment to [digitalgarden.maggiolo.net](https://digitalgarden.maggiolo.net/).

---

## 🤝 Contributing

Found a typo? Have a suggestion? Want to contribute?

1. 🍴 Fork the repository
2. 🌿 Create a feature branch (`git checkout -b feature/amazing-contribution`)
3. ✍️ Make your changes
4. ✅ Test locally with `mkdocs serve`
5. 📤 Push and create a Pull Request

**Note:** This is a personal knowledge base, so content contributions should align with my experiences. Bug fixes, improvements, and technical suggestions are always welcome! 💚

---

## 📝 Page Status System

Each page can have a status metadata tag:

- 🌱 **`status: draft`** - Rough ideas, incomplete thoughts
- 🌿 **`status: wip`** - Work in progress, being refined
- 🌳 **`status: done`** - Complete (but still evolving!)

Check out the [Digital Garden philosophy page](https://digitalgarden.maggiolo.net/digital-garden/) to learn more!

---

## 🎓 Learning Resources

Want to build your own digital garden? Check these out:

- 📘 [MkDocs Material Documentation](https://squidfunk.github.io/mkdocs-material/)
- 🌱 [Digital Gardening - Maggie Appleton](https://maggieappleton.com/garden-history)
- 🛠️ [Getting Started with MkDocs](https://jameswillett.dev/getting-started-with-material-for-mkdocs/)

---

## 📞 Connect

Want to chat? Find me on:

- 💼 [LinkedIn - Giorgio Maggiolo](https://linkedin.com/in/giorgio-maggiolo)
- 🐙 [GitHub - @aramilialon](https://github.com/aramilialon)
- 🌐 [Digital Garden](https://digitalgarden.maggiolo.net/)

---

## 📜 License

Copyright © 2025 Giorgio Maggiolo

This project is my personal knowledge base. Feel free to use it as inspiration for your own digital garden! 🌱

---

<div align="center">

### 🌟 If you find this interesting, give it a star! ⭐

**Happy Gardening! 🌻**

*Made with ❤️, ☕, and countless hours of learning*

</div>