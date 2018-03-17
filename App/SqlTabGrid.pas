Unit SQLtabGrid;
INTERFACE

uses   Windows, Messages, SysUtils, Variants, Classes, Graphics,
       Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
        Grids,           SQLITETABLE3,sqlite3;  // <==
{-----------------------------}
{  Table => GRID              }
{  SQL => (Uni)Table => GRID  }
{-----------------------------}
{ ---------     rotinas extras -----------------------------------}
{   UNItable T => Grid   G     }

procedure InicializaGrid(G: TStringGrid);
// inicializa grids 
procedure ExecTableToGrid(T: TSQLIteUNITable; Var G: TStringGrid);
// carrega uma UNItable T na grid G
procedure ExecSQLToGrid(SQL:Ansistring; var B:tSQLITEDATABASE; Var G: TStringGrid);
//  SQL => uniTable to grid G (usando a EXECTABLETOGRID)
 procedure ExecProcToGrid(arqproc:string; var B:tSQLITEDATABASE; Var G: TStringGrid);
// proc sql sem comandos .xxx nem comentarios --     =>grid. Comandos acabam c ;

IMPLEMENTATION
procedure InicializaGrid(G: TStringGrid);
begin
    { Set up the string grid. }
  G.ColCount := 3;
  G.DefaultColWidth := 100;   G.defaultrowheight := 19;
  G.Options := G.Options + [goColSizing, goThumbTracking];
  G.FixedCols := 0;   G.RowCount := 2
end; 

procedure ExecProcToGrid(arqproc:string; var B:tSQLITEDATABASE; Var G: TStringGrid);
Var T:TsqliteUniTable;  //B:tSQLITEDATABASE;
    sql:ansistring; aux:CHAR; a:textfile;
begin
  showmessage('..\modulos\'+arqproc); // sql em Modulos
 //  showmessage('..\DADOS\'+NB);       // bd em dados
  //b:=tSQLITEdATABASE.create(nb);   // t:=b.GetUniTable(Sql);

  showmessage(' oi1'); assignfile(a,arqproc); reset(a); // showmessage(' PASSOU ');
  sql:= '';  read(a,aux);  showmessage(' oi2');
  // atencao: precisa acabar comandos com ;
  while not eof(a)  do begin  // vai ate o ultimo char do arq 
   sql:= sql+aux ;
   //showmessage('aux='+aux+' sql='+sql);
   if aux=';' then begin      // fechou um comando
      showmessage('sql='+sql);// mostra o comando
      t:=b.GetUniTable(Sql); //vai exec um a um comando ate encontrar ; a ultima T tera algo?
      sql:=''
   end;   
   read(a,aux);
   end;
exectabletogrid(t,g);       //showmessage(inttostr(100*g.RowCount+g.ColCount));
T.Free; closefile(a);  //B.Free;
end;

{   UNItable T => Grid   G     }
procedure ExecTableToGrid( T: TSQLIteUNITable; Var G: TStringGrid);
var i, j : integer;
begin

 InicializaGrid(G);
  with T do  begin
    // ajusta o número de colunas do grid conforme da tabela
    G.ColCount := ColCount;    //showmessage(inttostr(colcount));
    // preenche a primeira linha do grid com o nome das colunas da tabela
    g.Font.Color:=$FF0000; // grid c/font blue
    for i := 0 to ColCount - 1 do begin
      G.Cells[i, 0] := Utf8ToAnsi(Columns[i]);
    end;
  // ajusta o número de linhas do grid conforme da tabela + a de cabeçalho do grid
  //  G.RowCount := Count + 1;  UNItable nao tem count    tem ROW
  // preenche as linhas do grid a conforme anda na tabela

    i := 0; G.RowCount:=G.RowCount - 1;
    while not EOF do begin
      Inc(i); G.RowCount:=G.RowCount + 1;
      for j := 0 to ColCount - 1 do
           G.Cells[j, i] := Utf8ToAnsi(Fields[j]);
      Next ;
    end;
    g.rowcount:=ROW+1;
    g.height:=g.RowHeights[0]*(g.rowcount+1); //  showmessage(inttostr(colcount));
    { G.Height := (G.RowCount * 23);  // Ajusta a altura do grid  - Joao Rodrigues }
  end;  // with
end;

{ ------------  SQL em um BD nb => Grid G -------------------- }
procedure ExecSQLToGrid(SQL:Ansistring; var B:tSQLITEDATABASE; Var G: TStringGrid);
{ pega uma SQL de um bd NB fechado executa-a gerando a tabela t e coloca-a na grid G }

{ mas e se o bd estiver aberto? melhor considerar q o bd B em questao deve estar aberto e mantem}
{procedure ExecSQLToGrid(SQL:Ansistring;var B:tSQLITEDATABASE; Var G: TStringGrid); <<== }

Var t:TsqliteUniTable;  //B:tSQLITEDATABASE;
begin
            //b:=tSQLITEdATABASE.create( nb); // abre o bd
t:=B.GetUniTable(Sql);
exectabletogrid(t,g);
T.Free;     //B.Free;
end;
{ ---------------fim rotinas extras ---------------------------------}
begin
end.
