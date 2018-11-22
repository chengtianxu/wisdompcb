unit UEmpChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB, Grids, DBGridEh;

type
  TFrmEmpChange = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl_EmpCode: TLabel;
    lbl3: TLabel;
    lbl_EmpName: TLabel;
    lbl5: TLabel;
    lbl_Dep: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl_sex: TLabel;
    lbl11: TLabel;
    lbl_InDate: TLabel;
    lbl13: TLabel;
    lbl_Position: TLabel;
    lbl15: TLabel;
    lbl_Rank: TLabel;
    lbl17: TLabel;
    lbl_type: TLabel;
    dbgrdh1: TDBGridEh;
    qry_EmpChange: TADOQuery;
    ds1: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmpChange: TFrmEmpChange;

implementation
       uses  udm;
{$R *.dfm}

procedure TFrmEmpChange.FormShow(Sender: TObject);
begin

   if Self.qry_EmpChange.IsEmpty then exit;
   self.lbl_EmpCode.Caption:=qry_EmpChange.fieldbyname('employeecode').asstring;
   self.lbl_EmpName.Caption:=qry_EmpChange.fieldbyname('chineseName').asstring;
 self.lbl_sex.Caption:=qry_EmpChange.fieldbyname('sexy').asstring;
 Self.lbl_Dep.Caption:=qry_EmpChange.fieldbyname('departmentName').asstring;
 Self.lbl_InDate.Caption:=qry_EmpChange.fieldbyname('ondutytime').asstring;
 self.lbl_Position.Caption:=qry_EmpChange.fieldbyname('oposition').asstring;
 self.lbl_type.Caption:=qry_EmpChange.fieldbyname('ohtype').asstring;
 self.lbl_Rank.Caption:=qry_EmpChange.fieldbyname('orank').asstring;
end;

end.
