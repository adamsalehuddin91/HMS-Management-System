import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Tempahan Online | HAIDA MUSLIMAH SALON",
  description: "Tempah servis salon Muslimah premium secara online. Pilih servis, tarikh & masa yang sesuai dengan anda.",
  openGraph: {
    title: "Tempahan Online | HAIDA MUSLIMAH SALON",
    description: "Tempah servis salon Muslimah premium secara online. Pilih servis, tarikh & masa yang sesuai dengan anda.",
    type: "website",
  },
};

export default function BookLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <div lang="ms">{children}</div>;
}
