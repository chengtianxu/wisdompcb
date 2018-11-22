unit AuditInfoUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseUnit1, DB, ADODB, ExtCtrls, Grids, DBGridEh, StdCtrls,
  Buttons;

type
  TAuditInfoForm2 = class(TBaseForm1)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Qwzpr85_30: TADOStoredProc;
    Qwzpr85_30user_id: TStringField;
    Qwzpr85_30user_full_name: TStringField;
    Qwzpr85_30auth_date: TDateTimeField;
    Qwzpr85_30ranking: TWordField;
    Qwzpr85_30user_ptr: TIntegerField;
    DataSource30: TDataSource;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuditInfoForm2: TAuditInfoForm2;

implementation
uses
  DMUnit1 ;
{$R *.dfm}

procedure TAuditInfoForm2.BitBtn1Click(Sender: TObject);
begin
  inherited;
  modalresult:=mrCancel	;
end;

procedure TAuditInfoForm2.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
   if not (gdFixed in State) then
       DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

end.
