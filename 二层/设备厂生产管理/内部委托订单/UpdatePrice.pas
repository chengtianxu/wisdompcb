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
    Label8: TLabel;
    DBEdit8: TDBEdit;
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
  with dm.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'update data0008 set new_price= ' + dbedit5.text
      + ' where PROD_CODE = ' + quotedstr(dbedit1.Text);
    execSql;
  end;
end;

end.
