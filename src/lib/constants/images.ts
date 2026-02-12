export const DEFAULT_SERVICE_IMAGE = "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?q=80&w=400&auto=format&fit=crop";
export const DEFAULT_PRODUCT_IMAGE = "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=400&auto=format&fit=crop";

export const CATEGORY_IMAGES: Record<string, string> = {
    // Hair
    "Haircut": "https://images.unsplash.com/photo-1595476108010-b4d1f102b1b1?q=80&w=400&auto=format&fit=crop",
    "Hair Spa": "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=400&auto=format&fit=crop",
    "Styling": "https://images.unsplash.com/photo-1522337660859-02fbefca4702?q=80&w=400&auto=format&fit=crop",
    "Color": "https://images.unsplash.com/photo-1634449571010-02389ed0f9b0?q=80&w=400&auto=format&fit=crop", // Changed to reliable one
    "Hair Color": "https://images.unsplash.com/photo-1634449571010-02389ed0f9b0?q=80&w=400&auto=format&fit=crop", // Explicit entry
    "Wash & Blow": "https://images.unsplash.com/photo-1519699047748-de8e457a634e?q=80&w=400&auto=format&fit=crop",

    // Face & Skin
    "Facial": "https://images.unsplash.com/photo-1512290923902-8a9f81dc236c?q=80&w=400&auto=format&fit=crop",
    "Treatment": "https://images.unsplash.com/photo-1616394584738-fc6e612e71b9?q=80&w=400&auto=format&fit=crop",
    "Makeup": "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=400&auto=format&fit=crop",
    "Threading": "https://images.unsplash.com/photo-1596462502278-27bfdd403cc2?q=80&w=400&auto=format&fit=crop",
    "Waxing": "https://images.unsplash.com/photo-1616394584738-fc6e612e71b9?q=80&w=400&auto=format&fit=crop",

    // Body & Wellness
    "Massage": "https://images.unsplash.com/photo-1519823551278-64ac92734fb1?q=80&w=400&auto=format&fit=crop",
    "Body Spa": "https://images.unsplash.com/photo-1600334089648-b0d9d3028eb2?q=80&w=400&auto=format&fit=crop",
    "Pedicure": "https://images.unsplash.com/photo-1519415387722-a1c3bbef716c?q=80&w=400&auto=format&fit=crop",
    "Manicure": "https://images.unsplash.com/photo-1604654894610-df63bc536371?q=80&w=400&auto=format&fit=crop",

    // Others
    "Henna": "https://images.unsplash.com/photo-1598393771348-18544cb432e6?q=80&w=400&auto=format&fit=crop", // Changed to reliable Henna/Mehndi image
    "Nails": "https://images.unsplash.com/photo-1632345031435-8727f6897d53?q=80&w=400&auto=format&fit=crop",
};

export const PRODUCT_IMAGES: Record<string, string> = {
    "Shampoo": "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=400&auto=format&fit=crop",
    "Conditioner": "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=400&auto=format&fit=crop",
    "Hair Oil": "https://images.unsplash.com/photo-1608248597279-f99d160bfbc8?q=80&w=400&auto=format&fit=crop",
    "Treatment": "https://images.unsplash.com/photo-1608248597279-f99d160bfbc8?q=80&w=400&auto=format&fit=crop",
    "Styling": "https://images.unsplash.com/photo-1599305090598-fe179d501227?q=80&w=400&auto=format&fit=crop",
    "Skincare": "https://images.unsplash.com/photo-1616394584738-fc6e612e71b9?q=80&w=400&auto=format&fit=crop",
    "Accessories": "https://images.unsplash.com/photo-1576426863848-c218530d9444?q=80&w=400&auto=format&fit=crop",
};

export function getServiceImage(category: string | null | undefined): string {
    if (!category) return DEFAULT_SERVICE_IMAGE;

    // exact match
    if (CATEGORY_IMAGES[category]) return CATEGORY_IMAGES[category];

    // partial match
    const lowerCat = category.toLowerCase();
    const match = Object.keys(CATEGORY_IMAGES).find(key => lowerCat.includes(key.toLowerCase()));

    return match ? CATEGORY_IMAGES[match] : DEFAULT_SERVICE_IMAGE;
}

export function getProductImage(category: string | null | undefined): string {
    if (!category) return DEFAULT_PRODUCT_IMAGE;

    // exact match
    if (PRODUCT_IMAGES[category]) return PRODUCT_IMAGES[category];

    // partial match
    const lowerCat = category.toLowerCase();
    const match = Object.keys(PRODUCT_IMAGES).find(key => lowerCat.includes(key.toLowerCase()));

    return match ? PRODUCT_IMAGES[match] : DEFAULT_PRODUCT_IMAGE;
}
