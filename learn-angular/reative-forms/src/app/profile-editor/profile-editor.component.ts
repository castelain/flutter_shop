import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.css'],
})
export class ProfileEditorComponent implements OnInit {
  profileForm = this.formBuilder.group({
    firstName: ['', Validators.required],
    lastName: [''],
    address: this.formBuilder.group({
      city: [''],
      street: [''],
    }),
    aliases: this.formBuilder.array([this.formBuilder.control('')]),
  });

  constructor(private formBuilder: FormBuilder) {}

  get aliases(): FormArray {
    return this.profileForm.get('aliases') as FormArray;
  }

  ngOnInit(): void {}

  onSubmit(): void {
    console.log('Profile Form: ', this.profileForm.value);
  }
  updateProfile(): void {
    this.profileForm.patchValue({
      firstName: 'molly',
      address: {
        street: 'street 1',
      },
    });
  }

  addAlias(): void {
    this.aliases.push(this.formBuilder.control(''));
  }
  deleteAlias(i: number): void {
    // this.aliases.controls.splice(i, 1);
  }
}
