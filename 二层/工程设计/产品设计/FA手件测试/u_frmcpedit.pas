unit u_frmcpedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  Tfrm_cpedit = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cpedit: Tfrm_cpedit;

implementation

uses uDM;

{$R *.dfm}

procedure Tfrm_cpedit.BitBtn3Click(Sender: TObject);
begin
     if  DBEdit2.Text='' then
  begin
    ShowMessage('请输入代码...');
    DBEdit2.SetFocus;
    Exit;
  end;


   if  DBEdit1.Text='' then
  begin
    ShowMessage('请输入名称...');
    DBEdit1.SetFocus;
    Exit;
  end;


  if  DBRadioGroup1.ItemIndex=-1 then
  begin
    ShowMessage('请选择审核流程...');
    DBRadioGroup1.SetFocus;
    Exit;
  end;




  dm.ADO0741.UpdateBatch();


  dm.ADO0741.Close;
  dm.ADO0741.Open;

  
end;

procedure Tfrm_cpedit.BitBtn1Click(Sender: TObject);
begin
  dm.ADO0741.CancelBatch();
end;

procedure Tfrm_cpedit.DBEdit2Exit(Sender: TObject);
begin
DBRadioGroup1.ItemIndex:=1;
end;

end.
