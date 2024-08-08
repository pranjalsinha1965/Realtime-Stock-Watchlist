import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Stock {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  symbol: string;

  @Column()
  name: string;
}
