unit PasChang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmChang = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    cbbtype: TComboBox;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure cbbtypeChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    arRate:array of Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChang: TfrmChang;

implementation

uses DAMO,Pick_Item_Single,ConstVar, PasNumber;


{$R *.dfm}
procedure TfrmChang.FormShow(Sender: TObject);
var
  i:Integer;
begin
  i:=0;
  with DM.adoTmp do
  begin
    Close;
    sql.Text:='select RKEY,CURR_CODE,EXCH_RATE from Data0001 ';
    Open;
    First;
    SetLength(arRate,RecordCount);
    while not Eof do
    begin
      cbbtype.Items.AddObject(FieldByName('CURR_CODE').AsString,Pointer(FieldByName('rkey').AsInteger));
      arRate[i]:= FieldByName('EXCH_RATE').AsCurrency;
      if DM.ado325_1curr_ptr.Value= FieldByName('rkey').Value then cbbtype.ItemIndex:=i;
      Inc(i);
      Next;      
    end;
  end;
end;

procedure TfrmChang.cbbtypeChange(Sender: TObject);
begin
  DM.ado325_1.Edit;
  DM.ado325_1curr_ptr.Value:= Integer(cbbtype.Items.Objects[cbbtype.ItemIndex]);
  DM.ado325_1ex_rate.Value:= arrate[cbbtype.ItemIndex];
end;

procedure TfrmChang.BitBtn1Click(Sender: TObject);
begin
  if DBEdit1.Text='' then
  begin
    ShowMessage('原币金额不能为空');
    Exit;
  end;
  if cbbtype.Text='' then
  begin
    ShowMessage('币别不能为空');
    Exit;
  end;
  ModalResult:=mrYes;
end;

procedure TfrmChang.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9','-',#8,#46]) then
  begin
    if (Key = #46) and (Pos('.',Trim(TEdit(Sender).Text))<>0) then
    Abort;
  end
  else Abort;
end;

end.
