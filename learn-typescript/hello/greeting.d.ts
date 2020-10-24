interface Person {
    firstName: string;
    lastName: string;
}
declare class Student {
    firstName: any;
    middleInitial: any;
    lastName: any;
    fullName: string;
    constructor(firstName: any, middleInitial: any, lastName: any);
}
declare function greeter(person: Person): string;
declare let user: Student;
