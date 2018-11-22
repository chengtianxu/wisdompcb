unit UpdatePrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Buttons;

type
  TfrmUpdatePrice = class(TForm)
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdatePrice: TfrmUpdatePrice;

implementation

uses DM_u;

{$R *.dfm}

procedure TfrmUpdatePrice.btnOKClick(Sender: TObject);
begin
  with DM.tmp do
  begin
    close;
    SQL.Clear;
    SQL.Text := 'update data0008 set new_price=' + dbedit4.Text
      + ' where prod_code= ' + quotedstr(dbedit1.Text);
    ExecSQL;
  end;
//  with dm.tmp1 do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('select 1 from Data0053 t53 inner join Data0492 t492 on t53.mo_ptr = t492.rkey');
//    SQL.Add('where t492.PRINTED_BY_PTR = '+dm.ADO71rkey.AsString);
//    Open;
//  end;
//  if DM.tmp1.RecordCount > 0 then
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'update wzcp0063 set price='+ dbedit4.Text +
            'where WZCP0063.cp71_ptr ='+dm.ADO71rkey.AsString;
    ExecSQL;
  end;
end;

end.
