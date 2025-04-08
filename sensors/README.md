### Informations about all tested/used sensors

#### Directory structure
```txt
sensors/
├─ sensor_name/
│  ├─ code/
│  ├─ pcb/          (optional)
│  ├─ models/       (optional)
│  ├─ datasheet.pdf (optional)
│  ├─ README.md
```

Each sensor has its own directory.
Inside, there is:
- `code/` for any code (e.g. `*.c` files),  
- `pcb/` for any `KiCad` project to provide schematics or pcb layout, optional
- `models/` for any 3d printable models neccessary to mount/test sensor, optional
- `datasheet.pdf` for documentation, if neccessary to have common informations, optional
- `README.md` with tests results, description etc.