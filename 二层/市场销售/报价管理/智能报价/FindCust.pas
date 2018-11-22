unit FindCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  TfrmFindCust = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtCust: TEdit;
    Label1: TLabel;
    sbtnRefresh: TSpeedButton;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    rdgCondition: TRadioGroup;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure edtCustChange(Sender: TObject);
    procedure sbtnRefreshClick(Sender: TObject);
    procedure rdgConditionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindCust: TfrmFindCust;

implementation

uses damo, Contract;

{$R *.dfm}

procedure TfrmFindCust.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure TfrmFindCust.edtCustChange(Sender: TObject);
begin
  if Label1.Caption = '客户代码' then
  begin
    if edtCust.Text <> '' then
      dm.aqFindCust.Filter:= ' CUST_CODE like ' +''+'%'+edtCust.Text+'%'+''
    else
      dm.aqFindCust.Filter:= '';
  end;
  if Label1.Caption = '客户名称' then
  begin
    if edtCust.Text <> '' then
      dm.aqFindCust.Filter:= ' CUSTOMER_NAME like ' +''+'%'+edtCust.Text+'%'+''
    else
      dm.aqFindCust.Filter:= '';
  end;
  if Label1.Caption = '参数描述' then
  begin
    if edtCust.Text <> '' then
      dm.aqParamName.Filter:= ' PARAMETER_DESC like ' +''+'%'+edtCust.Text+'%'+''
    else
      dm.aqParamName.Filter:= '';
  end;
end;

procedure TfrmFindCust.sbtnRefreshClick(Sender: TObject);
begin
  if rdgCondition.Visible then
    dm.OpenQuery(dm.aqFindCust, [])
  else
    dm.OpenQuery(dm.aqParamName, []);
    
  edtCustChange(Sender);
end;

procedure TfrmFindCust.rdgConditionClick(Sender: TObject);
begin
  if Visible then
  begin
    Label1.Caption:= rdgCondition.Items.Strings[rdgCondition.ItemIndex];
    edtCustChange(Sender);
  end;
end;

end.
