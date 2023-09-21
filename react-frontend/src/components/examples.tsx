import React from "react";

function Examples(props: any) {
  return (
    <div>
      {props.examples.map((example: any) => {
        return (
          <div key={example.id}>
            <h2>{example.name}</h2>
          </div>
        );
      })}
    </div>
  );
}

export default Examples;
