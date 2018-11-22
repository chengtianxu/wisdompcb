unit Frm_remark_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons;

type
  TFrm_remark = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_remark: TFrm_remark;

implementation
 uses data_module;
{$R *.dfm}

procedure TFrm_remark.FormShow(Sender: TObject);
begin
       Self.DBMemo1.MaxLength := 50;
end;

procedure TFrm_remark.DBMemo1KeyPress(Sender: TObject; var Key: Char);
var
    tmps:string;
begin
      tmps := Self.DBMemo1.Text;
      if length(tmps)  >= 50 then
      begin
             messagedlg('您只能输入50个字符长度',mtinformation,[mbok],0)
      end;    
end;

procedure TFrm_remark.DBEdit4Exit(Sender: TObject);
begin
if dbedit4.Text='' then
 dbedit4.Field.Value:=0;
end;

end.
