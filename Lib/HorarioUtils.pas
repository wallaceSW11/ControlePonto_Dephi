unit HorarioUtils;

interface

uses
  sysutils;

const
  HORARIO_EM_BRANCO = '--:--';
  HORARIO_VAZIO = '';
  HORARIO_ZERADO = '00:00';

function HorarioValido(const pHora: string): Boolean;
function HorarioInvalido(const pHora: string): Boolean;
function HoraToTime(const pHora: string): TTime;
function TimeToHora(const pHora: TTime): string;
function HoraAtual(): string;
function DataAtual(): string;

implementation

function HorarioValido(const pHora: string): Boolean;
begin
  Result := ((pHora <> HORARIO_EM_BRANCO) and (pHora <> HORARIO_VAZIO) and (pHora <> HORARIO_ZERADO));
end;

function HorarioInvalido(const pHora: string): Boolean;
begin
  Result := (not HorarioValido(pHora));
end;

function HoraToTime(const pHora: string): TTime;
begin
  Result := StrToTime(pHora);
end;

function TimeToHora(const pHora: TTime): string;
begin
  Result := FormatDateTime('HH:MM', pHora);
end;

function HoraAtual(): string;
begin
  Result := FormatDateTime('HH:MM', Now());
end;

function DataAtual(): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', Now());
end;



end.
