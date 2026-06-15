declare module "react-leaflet-markercluster" {
  import type { ComponentType } from "react";
  import type { MarkerClusterGroupOptions } from "leaflet";

  export interface MarkerClusterGroupProps extends MarkerClusterGroupOptions {
    children?: React.ReactNode;
  }

  const MarkerClusterGroup: ComponentType<MarkerClusterGroupProps>;
  export default MarkerClusterGroup;
}
