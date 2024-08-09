import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class Stock {
  @PrimaryGeneratedColumn()
  id!: number;  // Automatically generated unique identifier for each stock

  @Column({ type: 'varchar', length: 10, unique: true })
  symbol!: string;  // Stock symbol (e.g., AAPL for Apple)

  @Column({ type: 'varchar', length: 255 })
  name!: string;  // Full name of the stock

  @Column({ type: 'float', precision: 2 })
  price!: number;  // Price of the stock
}
