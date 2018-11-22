unit edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses main, Unit1;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 if trim(edit1.Text)='' then
  begin
   messagedlg('保存失败,产品种类代码不能为空!',mtinformation,[mbok],0);
   edit1.setfocus;
   exit;
  end ;

  dm.ADOConnection1.BeginTrans;
  try
  
   dm.adotable1['PR_GRP_CODE']:=edit1.text;
   dm.adotable1['PRODUCT_GROUP_NAME']:=edit2.text;
   dm.ADOTable1.Post;
   dm.ADOConnection1.CommitTrans;
 except
   dm.ADOConnection1.RollbackTrans;
   edit1.SetFocus;
   exit;
 end;
  modalresult:=mrok;
end;
procedure TForm2.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.Show;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
edit1.SetFocus ;
edit1.SelectAll;
end;

end.
