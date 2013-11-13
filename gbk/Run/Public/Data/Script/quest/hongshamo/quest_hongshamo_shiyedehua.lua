--ʦү�Ļ�

--MisDescBegin
x205013_g_ScriptId = 205013
--x205013_g_MissionIdPre =40
x205013_g_MissionId = 53
x205013_g_MissionKind = 11
x205013_g_MissionLevel = 55
--x205013_g_ScriptIdNext = {ScriptId = 205002 ,LV = 1 }
x205013_g_Name	="������ģʦү" 
x205013_g_Name2	="�ٲ�̨" 
--x205013_g_DemandItem ={{id=13010003,num=1}}
--x205013_g_noDemandKill ={{id=301,num=1}}	

x205013_g_MissionName="ʦү�Ļ�"
x205013_g_MissionInfo="    �������������ӣ���Ħڭħ�������۰������ӣ��������ǻ�����ģ�۹��ļ̳��ߣ��ڻ�����ģ�۹�֮�ϣ�һ�е�Ů�˺ͲƱ������������������ӵģ��������ǿڴ�����Ķ���������ҵĻ���ȥ�����ǵ���ͷ�������ǵ�Ů�˺ͲƱ����£���˳�����ǵĹ���������Ŷ���ǣ���˳�����ǵ����ӣ��ŷ���������Ȼ�������ٺ٣�"  --��������
x205013_g_MissionTarget="    ��ʦү�Ļ�����#G�ٲ�̨#W������"		
x205013_g_MissionComplete="    ����Ұ�ģ�����ֻ���ڿ������Ǵ�������Щ�Ʊ���̰���Ļ�����ģ�ˣ�һ���᳢������������ֶΡ�"					--�������npc˵���Ļ�
--x205013_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x205013_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205013_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205013_g_RadioItemBonus={}

--MisDescEnd
x205013_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205013_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205013_g_MissionName)
		     AddText(sceneId,x205013_g_MissionComplete)
		     AddMoneyBonus(sceneId, x205013_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205013_g_ScriptId, x205013_g_MissionId)
                

        elseif x205013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205013_g_MissionName)
                AddText(sceneId,x205013_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205013_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205013_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205013_g_ScriptId, x205013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205013_g_ScriptId, x205013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205013_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205013_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==5) then
        	if (GetName(sceneId,targetId)==x205013_g_Name) then
        	        if IsHaveMission(sceneId,selfId, x205013_g_MissionId)<= 0 then
        	            	return 1
        	        end
        	end
		if (GetName(sceneId,targetId)==x205013_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x205013_g_MissionId) > 0 then
			    	return 1
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205013_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x205013_g_MissionId, x205013_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x205013_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x205013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205013_g_MissionId)
	for i, item in pairs(x205013_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205013_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205013_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205013_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205013_g_MissionId)
		AddExp(sceneId, selfId, x205013_g_ExpBonus)
		AddMoney(sceneId, selfId, x205013_g_MoneyBonus)
		for i, item in pairs(x205013_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x205013_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205013_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205013_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x205013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205013_OnItemChanged(sceneId, selfId, itemdataId)

end

