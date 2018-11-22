unit uSelRpt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TSelRpt = class(TForm)
    Button5: TButton;
    Button6: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelRpt: TSelRpt;

implementation

uses uDM,uReptForm,RpDefine;

{$R *.dfm}

procedure TSelRpt.Button1Click(Sender: TObject);
begin                             //第一步实现stg2的插入

end;

procedure TSelRpt.Button3Click(Sender: TObject);

begin                               //第一步实现stg1的插入

end;
//打印
procedure TSelRpt.Button5Click(Sender: TObject);
var
  msql:string;
begin

  dm.ADOQ.Close;
  dm.ADOQ.SQL.Clear ;
  msql:='SELECT RKEY,VOUCHER from data0105 ';
  msql:=msql+' where voucher>='+''''+trim(edit1.Text) +'''';
  msql:=msql+' and ';
  msql:=msql+' voucher<='+''''+trim(edit1.Text) +'''';
  msql:=msql+' order by voucher';

  dm.ADOQ.SQL.text:=msql;
  dm.ADOQ.open ;
  if dm.ADOQ.RecordCount=0 then
    begin
      messagedlg('此范围无凭证可打印！',mtinformation,[mbok],0);
      exit;
    end;
  Application.CreateForm(TForm1, Form1);
  Form1.RvProject1.ProjectFile :='TranRpt.rav';
  Form1.RvSystem1.DefaultDest :=rdPrinter;

  while not dm.ADOQ.Eof do
    begin
     Form1.ADOQRept.Close ;
     Form1.ADOQRept.parameters.ParamByName('vrkey').Value :=
     DM.ADOQ.fieldbyname('rkey').AsInteger;
     Form1.ADOQRept.Open ;
     dm.ADOQ.next;

     Form1.RvProject1.Execute;
    end;



end;

procedure TSelRpt.Button6Click(Sender: TObject);
begin
  close;
end;

end.
