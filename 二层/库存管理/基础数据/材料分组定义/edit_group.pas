unit edit_group;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TForm2 = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    v_close:byte;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses ConstVar, main, Pick_Item_Single;

{$R *.dfm}

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 form1.ADOTable1.Cancel;
 form2.ModalResult:=mrcancel;
 v_close:=1; //正常退出
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 v_close:=0;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close=0 then //非正常退出
  form1.ADOTable1.Cancel;
  form1.Show;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin

 if trim(dbedit1.Text)='' then
  begin
   messagedlg('组别代码不能为空!',mtinformation,[mbok],0);
   dbedit1.SetFocus;
  end
 else
  begin
 form1.ADOConnection1.BeginTrans;

 try
  form1.adotable1.Post;
  form1.ADOConnection1.CommitTrans;
 except
  form1.ADOConnection1.RollbackTrans;
  dbedit1.SetFocus;
  exit;
 end;
 ModalResult:=mrok;
   end;
end;

end.
