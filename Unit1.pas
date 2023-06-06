unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractConnection, ZConnection, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls;

type
  TForm1 = class(TForm)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    l_1: TLabel;
    l_2: TLabel;
    l_3: TLabel;
    l_4: TLabel;
    l_5: TLabel;
    Edt1: TEdit;
    Edt2: TEdit;
    Edt3: TEdit;
    Edt4: TEdit;
    Edt5: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  id: String;

implementation

{$R *.dfm}

procedure TForm1.btn2Click(Sender: TObject);
begin
ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into tb_kostumer values(null,"'+Edt1.Text+'","'+Edt2.Text+'","'+Edt3.Text+'","'+Edt4.Text+'","'+Edt5.Text+'")');
  ZQuery1.ExecSQL ;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select * from tb_kostumer');
  ZQuery1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
Edt1.Clear;
Edt2.Clear;
Edt3.Clear;
Edt4.Clear;
Edt5.Clear;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(' delete from tb_kostumer where id_kostumer= 8');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select * from tb_kostumer');
  ZQuery1.Open;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('update tb_kostumer set nama_kostumer ="'+Edt1.Text+'",telp ="'+Edt2.Text+'",alamat ="'+Edt3.Text+'",kota ="'+Edt4.Text+'",kodepos ="'+Edt5.Text+'" where id_kostumer= "'+id+'"');
ZQuery1.ExecSQL;

ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from tb_kostumer');
ZQuery1.Open;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);

begin
id:=Zquery1.Fields[0].AsString;
Edt1.Text:=Zquery1.Fields[1].AsString;
Edt2.Text:=Zquery1.Fields[2].AsString;
Edt3.Text:=Zquery1.Fields[3].AsString;
Edt4.Text:=Zquery1.Fields[4].AsString;
Edt5.Text:=Zquery1.Fields[5].AsString;

end;

end.
