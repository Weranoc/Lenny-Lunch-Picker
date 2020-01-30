import React from 'react';
import {
    withGoogleMap,
    GoogleMap,
    Marker,
  } from "react-google-maps";
  const MapWithAMarker = withGoogleMap(props =>
    <GoogleMap
      defaultZoom={15}
      defaultCenter={{ lat: 57.7089, lng: 11.9746 }}
    >
      <Marker
        position={{ lat: 57.7089, lng: 11.9746 }}
      />
    </GoogleMap>
  );
  export class Map extends React.Component {
  constructor(props) { 
  super(props); 
  this.state = { };
  }
  
  render (){
    return(
      <div>
        <MapWithAMarker
          containerElement={<div style={{ height: `400px`, width: `400px` }} />}
          mapElement={<div style={{ height: `400px`, width: `400px`}} />}
        />
      </div>
      )
    }
  }

export default Map;