# Modern Neovim Configuration

Αυτή είναι μια σύγχρονη παραμετροποίηση για το Neovim, σχεδιασμένη για να προσφέρει μια ολοκληρωμένη εμπειρία ανάπτυξης, ειδικά για Go και τεχνολογίες web (HTML, CSS, JavaScript, TypeScript).

## ✨ Χαρακτηριστικά

- **Μοντέρνα Εμφάνιση**: Minimal θέμα και UI components (lualine, bufferline).
- **Γρήγορη Πλοήγηση**: "Fuzzy finding" αρχείων, buffers και κειμένου με το `telescope.nvim`.
- **Έξυπνη Επεξεργασία Κώδικα**:
  - Αυτόματη συμπλήρωση (autocompletion) με το `nvim-cmp`.
  - Υποστήριξη Language Server Protocol (LSP) για diagnostics, definitions κ.α.
  - Αυτόματη εγκατάσταση LSPs και formatters με το `mason.nvim`.
  - Άμεση επισήμανση λαθών με το `trouble.nvim`.
- **Αυτόματο Formatting**: `conform.nvim` για αυτόματο format του κώδικα κατά την αποθήκευση.
- **Ενσωματωμένο Terminal**: Διαχείριση terminal μέσα από το Neovim με το `toggleterm.nvim`.
- **Διαχείριση Sessions**: Αποθήκευση και φόρτωση sessions με το `persistence.nvim`.
- **Live Server**: Ενσωματωμένος live server για web development.

## ⚙️ Προαπαιτούμενα

Πριν την εγκατάσταση, βεβαιωθείτε ότι έχετε τα παρακάτω εργαλεία στο σύστημά σας. Οι παρακάτω οδηγίες αφορούν Arch Linux.

### 1. Εργαλεία Συστήματος (Pacman)

Εγκαταστήστε τα βασικά εργαλεία, συμπεριλαμβανομένων των `git`, `ripgrep` (για το Telescope), `go`, `nodejs`, `npm`, και τα build tools (`base-devel`). Επιπλέον, για βέλτιστη λειτουργία, εγκαταστήστε τα `wget`, `fd`, `python-pip` και `python-pynvim`.

```bash
sudo pacman -Syu --noconfirm git ripgrep go nodejs npm base-devel wget fd python-pip python-pynvim
```

### 2. Εργαλεία Node.js (NPM)

Το `live-server` χρησιμοποιείται για την προεπισκόπηση των web projects και το `neovim` για την υποστήριξη του Node.js provider. Εγκαταστήστε τα global μέσω `npm`.

```bash
sudo npm install -g live-server neovim
```

### 3. Ρύθμιση Tmux (προαιρετικό)

Αν χρησιμοποιείτε `tmux`, συνιστάται η ρύθμιση του terminal σας για να αποφύγετε προβλήματα με την απεικόνιση των χρωμάτων στο Neovim. Προσθέστε την ακόλουθη γραμμή στο αρχείο `~/.tmux.conf`:

```bash
set-option -g default-terminal "screen-256color"
```
Μετά την προσθήκη, επανεκκινήστε το tmux ή φορτώστε ξανά τη ρύθμιση (`tmux source-file ~/.tmux.conf`).

### 4. Nerd Font

Για τη σωστή εμφάνιση των εικονιδίων στο UI, είναι απαραίτητη η εγκατάσταση μιας γραμματοσειράς τύπου "Nerd Font".

1.  Κατεβάστε μια γραμματοσειρά από το [www.nerdfonts.com](https://www.nerdfonts.com/font-downloads). Μια καλή επιλογή είναι η **FiraCode Nerd Font**.
2.  Εγκαταστήστε τη στο σύστημά σας (συνήθως με διπλό κλικ και "Install").
3.  Ρυθμίστε το terminal σας να χρησιμοποιεί τη νέα γραμματοσειρά.

## 🚀 Εγκατάσταση

1.  **Δημιουργήστε αντίγραφο ασφαλείας των παλιών ρυθμίσεων (προαιρετικά αλλά συνιστάται):**
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    mv ~/.local/state/nvim ~/.local/state/nvim.bak
    mv ~/.cache/nvim ~/.cache/nvim.bak
    ```

2.  **Κλωνοποιήστε το repository στον φάκελο ρυθμίσεων του Neovim:**
    ```bash
    git clone https://github.com/TheShaicho/nvim.git ~/.config/nvim
    ```
    **Σημείωση:** Αντικαταστήστε το `https://github.com/your-username/your-repo-name.git` με το πραγματικό URL του repository σας.

3.  **Ξεκινήστε το Neovim:**
    ```bash
    nvim
    ```
    Κατά την πρώτη εκκίνηση, ο package manager `lazy.nvim` θα εγκαταστήσει αυτόματα όλα τα plugins. Αμέσως μετά, το `mason.nvim` θα εγκαταστήσει τους LSPs και τα formatters. Η διαδικασία μπορεί να πάρει μερικά λεπτά. Ακολουθήστε τις οδηγίες που μπορεί να εμφανιστούν στην οθόνη.
