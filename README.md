# Bobbie-Cocaine

**Comprehensive Cocaine Production & Sales Workflow for QBCore**

A fully featured FiveM script for the QBCore framework that enables players to:

- 🌿 **Harvest** coca leaves in the field  
- 🧪 **Process** leaves into cocaine in a lab  
- 💵 **Sell** processed cocaine to NPCs with randomized pricing  

---

## Key Features

1. **Seamless Inventory Integration**  
   - Utilizes **ox_inventory** for item registration, stacking, and custom images.  
2. **Realistic Progress Indicators**  
   - Employs **lib.progressBar** for in-world action durations (gathering, processing, selling).  
3. **Configurable**  
   - Easy-to-edit `config.lua` for coordinates, process times, batch sizes, and price ranges.  
4. **Robust Client/Server Separation**  
   - Server-side events for security and client-side triggers for smooth gameplay.  
5. **Clean Code Structure**  
   - Modular file layout: `fxmanifest.lua`, `config.lua`, `server/main.lua`, `client/main.lua`, and optional HTML UI.  

---

## File Structure

```
bobbie-cocaine/
├── fxmanifest.lua         # Resource definition
├── config.lua             # Script configuration
├── server/
│   └── main.lua           # Server-side logic
├── client/
│   └── main.lua           # Client-side interactions
└── html/                  # Optional custom inventory UI
    ├── index.html
    ├── css/
    │   └── style.css
    └── js/
        └── main.js
```

---

## Installation

Clone this repository into your FiveM resources folder:

```bash
cd your_fivem_server/resources
git clone https://github.com/YourName/bobbie-cocaine.git
```

Then add to your `server.cfg`:

```cfg
start bobbie-cocaine
```

Ensure **ox_inventory**, **oxmysql**, and **lib** (for `progressBar`) are installed and started, then restart your server.

---

## Configuration

Open **`config.lua`** to adjust:

| Setting                | Description                                | Default                                 |
|------------------------|--------------------------------------------|-----------------------------------------|
| `Config.Field`         | Coordinates for coca leaf gathering point | `vector3(2228.12, 5574.91, 53.74)`      |
| `Config.Lab`           | Coordinates for processing lab            | `vector3(1088.15, -3186.73, -38.99)`    |
| `Config.Sell`          | Coordinates for NPC selling location      | `vector3(-63.31, -1280.85, 28.27)`      |
| `Config.ProcessAmount` | Number of leaves required per batch       | `5`                                     |
| `Config.ProcessTime`   | Processing duration (milliseconds)        | `15000`                                 |
| `Config.SellPrice`     | Price range (min/max) per cocaine bag     | `{min = 150, max = 200}`                |

You can swap out the `image` URLs for any custom icons.

---

## Usage

1. **Harvesting**: Go to the field marker, press `E`, and wait for the progress bar to finish.  
2. **Processing**: Head to the lab marker, press `E`, and convert leaves into cocaine.  
3. **Selling**: Visit the NPC sell point, press `E`, and offload your product for cash.  

Notifications appear via `QBCore:Notify`.

---

## Contributing

1. Fork the repository.  
2. Create a branch: `git checkout -b feature/YourFeature`.  
3. Commit: `git commit -m "Add some feature"`.  
4. Push: `git push origin feature/YourFeature`.  
5. Open a Pull Request.  

Please follow existing style and document any changes.

---

## License

Distributed under the **MIT License**. See `LICENSE` for details.

---

*Made with ❤️ by **Bobbie***
