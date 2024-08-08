import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class Stock {
  @PrimaryGeneratedColumn()
  id!: number;  // Using non-null assertion

  @Column()
  symbol!: string;  // Using non-null assertion

  @Column()
  name!: string;  // Using non-null assertion

  @Column('float')
  price!: number;  // Using non-null assertion
}
