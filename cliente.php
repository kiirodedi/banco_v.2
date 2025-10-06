<?php
    class Cliente
    {
        protected ?int $id = null;
        protected string $usuario;
        protected string $senha;
        protected int $telefone;
        protected string $endereco;

        public function __construct(string $usuario, string $senha, int $telefone, string $endereco)
        {
            $this->usuario = $usuario;
            $this->senha = $senha;
            $this->telefone = $telefone;
            $this->endereco = $endereco;
        }

        public function getUsuario(): string { return $this->usuario; }
        public function getTelefone(): int { return $this->telefone; }
        public function getEndereco(): string { return $this->endereco; }

        public function setId(int $id): void
        {
            $this->id = $id;
        }

        public function __toString(): string
        {
            $statusId = $this->id ?? 'Não Salvo';
            return "Cliente ID: {$statusId} | Usuário: {$this->usuario}";
        }
    }
?>