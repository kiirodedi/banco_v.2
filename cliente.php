<?php

/**
 * Classe base que representa um Cliente.
 * Contém os dados comuns de login e contato.
 */
class Cliente
{
    // Atributos mapeados da tabela 'cliente'
    protected ?int $id = null; // ID da chave primária (null se ainda não estiver no banco)
    protected string $usuario;
    protected string $senha; // Lembrete: Senha deve ser HASHED em apps reais!
    protected int $telefone; 
    protected string $endereco;

    public function __construct(string $usuario, string $senha, int $telefone, string $endereco)
    {
        $this->usuario = $usuario;
        $this->senha = $senha;
        $this->telefone = $telefone;
        $this->endereco = $endereco;
    }

    // --- Getters e Setters ---

    public function getUsuario(): string { return $this->usuario; }
    public function getTelefone(): int { return $this->telefone; }
    public function getEndereco(): string { return $this->endereco; }

    /**
     * Define o ID, geralmente usado ao carregar do banco de dados.
     */
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    // Simula o método ToString() do C#
    public function __toString(): string
    {
        $statusId = $this->id ?? 'Não Salvo';
        return "Cliente ID: {$statusId} | Usuário: {$this->usuario}";
    }
}
