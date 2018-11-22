unit Report12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls, DBClient, Provider; 

type
  TPercent = record
    Sup: string;   //供应商
    FZ: integer;   //准时Count
    FM: integer;   //准时+甩期Count
  end;
  TfrmReport12 = class(TfrmBaseForm)
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    aqQueryPO_NUMBER: TStringField;
    aqQueryFOB: TStringField;
    aqQueryPO_DATE: TDateTimeField;
    aqQueryDATE_EDITED: TDateTimeField;
    aqQueryEMPLOYEE_NAME: TStringField;
    aqQueryABBR_NAME: TStringField;
    aqQueryCURR_CODE: TStringField;
    aqQueryDESCRIPTION: TStringField;
    aqQueryDESCRIPTION2: TStringField;
    aqQueryGUI_GE: TStringField;
    aqQueryQUAN_ORD: TFloatField;
    aqQuerytax_price: TFloatField;
    aqQueryPO_REV_NO: TStringField;
    aqQueryDEPT_NAME: TStringField;
    aqQueryQUANTITY_RECEIVED: TFloatField;
    aqQueryno_recd: TFloatField;
    aqQuerytotal: TFloatField;
    aqQueryUNIT_NAME: TStringField;
    aqQueryV_STATUS: TStringField;
    aqQueryEXPIRED_DATE: TDateTimeField;
    aqQueryDEL_DATE: TDateTimeField;
    aqQueryrecd_date: TDateTimeField;
    aqQueryTag: TStringField;
    aqQueryZSJFL: TFloatField;
    aqQueryrohs: TStringField;
    aqQuerywh_abb_name: TStringField;
    aqQueryreason: TStringField;
    cds1PO_NUMBER: TStringField;
    cds1FOB: TStringField;
    cds1PO_DATE: TDateTimeField;
    cds1DATE_EDITED: TDateTimeField;
    cds1EMPLOYEE_NAME: TStringField;
    cds1ABBR_NAME: TStringField;
    cds1CURR_CODE: TStringField;
    cds1DESCRIPTION: TStringField;
    cds1DESCRIPTION2: TStringField;
    cds1GUI_GE: TStringField;
    cds1QUAN_ORD: TFloatField;
    cds1tax_price: TFloatField;
    cds1PO_REV_NO: TStringField;
    cds1DEPT_NAME: TStringField;
    cds1QUANTITY_RECEIVED: TFloatField;
    cds1no_recd: TFloatField;
    cds1total: TFloatField;
    cds1UNIT_NAME: TStringField;
    cds1V_STATUS: TStringField;
    cds1EXPIRED_DATE: TDateTimeField;
    cds1DEL_DATE: TDateTimeField;
    cds1recd_date: TDateTimeField;
    cds1Tag: TStringField;
    cds1ZSJFL: TFloatField;
    cds1rohs: TStringField;
    cds1wh_abb_name: TStringField;
    cds1reason: TStringField;
    aqQueryPM_GG: TStringField;
    cds1PM_GG: TStringField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    ZSJFL: array of TPercent;
  public
    { Public declarations }
  end;

var
  frmReport12: TfrmReport12;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport12.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport12.btnQueryClick(Sender: TObject);
var
  i: byte;
  j,k: integer;
  Find: boolean;
  vCondition: widestring;
begin
  inherited;
  with frmCondition do
  begin
    dtpk1.Date:= Now-7;
    dtpk2.Date:= Now;
    if ShowModal = mrok then
    begin
      with aqQuery do
      begin
        if ((cds1.Active) and (cds1.IndexName<>'')) then cds1.DeleteIndex(cds1.IndexName);
        cds1.Close;      
        Close;
        Parameters[0].Value:= frmCondition.Link;
        for i:= 1 to frmCondition.SGrid1.RowCount - 2 do
          vCondition:= vCondition + frmCondition.SGrid1.Cells[2,i] + #13;
        Parameters[1].Value:= 'and t72.DEL_DATE Between '''+formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtpk1_1.Time)+
                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtpk2_2.Time)+''''+char(13)+vCondition;
        Parameters[2].Value:= 'Order By t70.PO_NUMBER';
        Open;
        cds1.Open;

        //计算&更新准时交付率
        cds1.DisableControls;
        try
          First;
          Find:= False;
          SetLength(ZSJFL,0);
          SetLength(ZSJFL,1);
          while not Eof do
          begin
            k:= Length(ZSJFL)-1;
            while k>=0 do
            begin
              if ZSJFL[k].Sup = aqQuery.FieldByName('ABBR_NAME').AsString then
              begin
                if aqQuery.FieldByName('Tag').AsString = '准时' then
                begin
                  ZSJFL[k].FZ:= ZSJFL[k].FZ+1;
                  ZSJFL[k].FM:= ZSJFL[k].FM+1;
                end;
                if aqQuery.FieldByName('Tag').AsString = '甩期' then
                  ZSJFL[k].FM:= ZSJFL[k].FM+1;
                Find:= True;
                break;
              end;
              k:= k-1;
            end;
            if not Find then
            begin
              SetLength(ZSJFL,Length(ZSJFL)+1);
              ZSJFL[Length(ZSJFL)-1].Sup:= aqQuery.FieldByName('ABBR_NAME').AsString;
              if aqQuery.FieldByName('Tag').AsString = '准时' then
              begin
                ZSJFL[Length(ZSJFL)-1].FZ:= 1;
                ZSJFL[Length(ZSJFL)-1].FM:= 1;
              end;
              if aqQuery.FieldByName('Tag').AsString = '甩期' then
                ZSJFL[Length(ZSJFL)-1].FM:= 1;
            end;
            Find:= False;
            Next;
          end;

          //更新准时交付率
          cds1.First;
          while not cds1.Eof do
          begin
            for j:= 0 to Length(ZSJFL)-1 do
            begin
              if ZSJFL[j].Sup = cds1.FieldByName('ABBR_NAME').AsString then
              begin
                if not(cds1.state in[dsedit]) then cds1.edit;
                if ZSJFL[j].FM = 0 then
                  cds1.FieldByName('ZSJFL').AsFloat:= 0
                else
                  cds1.FieldByName('ZSJFL').AsFloat:= 100*ZSJFL[j].FZ/ZSJFL[j].FM;
                break;
              end;
            end;
            cds1.Next;
          end;
        finally
          cds1.EnableControls;
        end;                
      end;
    end;
  end;
end;

end.
