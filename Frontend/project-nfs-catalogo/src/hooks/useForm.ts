import { ChangeEvent, useState } from "react";

export const useForm = <T>(initialForm: T) => {
    const [formState, setFormState] = useState<T>(initialForm);
  
    const onInputChange = (event: ChangeEvent<HTMLInputElement>) => {
      const { name, value } = event.target;
      setFormState((prevFormState) => ({
        ...prevFormState,
        [name]: value,
      }));
    };
  
    const resetForm = () => {
      setFormState(initialForm);
    };
  
    return { formState, onInputChange, resetForm };
  };
  