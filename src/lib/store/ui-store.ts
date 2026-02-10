import { create } from 'zustand';
import { persist } from 'zustand/middleware';

export type FontSize = 'small' | 'medium' | 'large';

interface UIState {
    isSidebarOpen: boolean;
    fontSize: FontSize;
    toggleSidebar: () => void;
    closeSidebar: () => void;
    openSidebar: () => void;
    setFontSize: (size: FontSize) => void;
}

export const useUIStore = create<UIState>()(
    persist(
        (set) => ({
            isSidebarOpen: false,
            fontSize: 'medium',
            toggleSidebar: () => set((state) => ({ isSidebarOpen: !state.isSidebarOpen })),
            closeSidebar: () => set({ isSidebarOpen: false }),
            openSidebar: () => set({ isSidebarOpen: true }),
            setFontSize: (fontSize) => set({ fontSize }),
        }),
        {
            name: 'hms-ui-settings',
        }
    )
);
