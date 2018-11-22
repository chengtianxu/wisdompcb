unit Recordt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh;

type
  Tfrm_Recordt = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Recordt: Tfrm_Recordt;

implementation

uses damo;

{$R *.dfm}

end.
